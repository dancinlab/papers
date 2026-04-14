#!/usr/bin/env python3
# @hexa-first-exempt -- CLI helper used by upload_zenodo.hexa (stage1 blocked on atomic-write json glue)
#
# manifest_update.py -- manifest.json post-upload PP3 hook (VERIFY-P2-2)
#
# Usage (single-paper post-upload):
#   python3 manifest_update.py update \
#       --paper-id N6-FOO --doi 10.5281/zenodo.12345 --zenodo-id 12345 \
#       [--file relpath/to/paper.md] [--title "..."] [--dry-run]
#
# Usage (reconcile from upload_results_*.txt + manifest):
#   python3 manifest_update.py reconcile [--dry-run]
#
# Contract:
#   - Entry found (by id OR matching file/source) -> update status=Published,
#     doi/zenodo_doi, zenodo_record, published_at=today.
#   - Entry NOT found -> insert new stub; bump _meta.total_papers and
#     metadata.total_papers; set _meta.updated=today.
#   - Atomic write: tempfile (same dir) -> os.replace().
#   - --dry-run: print delta JSON, NO disk writes.
#
# Exit codes:
#   0 = success
#   1 = logical error (e.g., bad input)
#   2 = IO error

import argparse
import datetime as _dt
import json
import os
import re
import sys
import tempfile
from typing import Optional

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MANIFEST_PATH = os.path.join(REPO_ROOT, "manifest.json")
TODAY = _dt.date.today().isoformat()  # ISO YYYY-MM-DD


def _load_manifest(path: str = MANIFEST_PATH) -> dict:
    with open(path, "r", encoding="utf-8") as fh:
        return json.load(fh)


def _atomic_write(path: str, data: dict) -> None:
    """Write JSON atomically: tempfile in same dir, fsync, os.replace.
    Guarantees no partial file even on interrupt (POSIX rename is atomic)."""
    directory = os.path.dirname(os.path.abspath(path)) or "."
    fd, tmp = tempfile.mkstemp(prefix=".manifest.", suffix=".json.tmp", dir=directory)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as fh:
            json.dump(data, fh, indent=2, ensure_ascii=False)
            fh.write("\n")
            fh.flush()
            os.fsync(fh.fileno())
        os.replace(tmp, path)
    except Exception:
        try:
            os.unlink(tmp)
        except OSError:
            pass
        raise


def _find_entry_index(manifest: dict, *, paper_id: Optional[str],
                      file_rel: Optional[str]) -> int:
    papers = manifest.get("papers", [])
    if paper_id:
        for i, p in enumerate(papers):
            if p.get("id") == paper_id:
                return i
    if file_rel:
        norm = file_rel.lstrip("./")
        for i, p in enumerate(papers):
            for key in ("file", "source"):
                val = p.get(key, "") or ""
                if val and (val == file_rel or val.lstrip("./") == norm
                            or val.endswith("/" + os.path.basename(norm))):
                    return i
    return -1


def _mark_published(entry: dict, *, doi: str, zenodo_id: str) -> dict:
    before = {k: entry.get(k) for k in ("status", "doi", "zenodo_doi",
                                        "zenodo_record", "published_at")}
    entry["status"] = "Published"
    # Both doi-style keys exist in the repo (doi for tecs-l/anima rows,
    # zenodo_doi for n6-fusion/neuro rows). Keep both in sync.
    entry["doi"] = doi
    entry["zenodo_doi"] = doi
    entry["zenodo_record"] = str(zenodo_id)
    entry["published_at"] = TODAY
    after = {k: entry.get(k) for k in ("status", "doi", "zenodo_doi",
                                       "zenodo_record", "published_at")}
    return {"before": before, "after": after}


def cmd_update(args) -> int:
    manifest = _load_manifest()
    idx = _find_entry_index(manifest, paper_id=args.paper_id, file_rel=args.file)
    delta = {"mode": "update", "paper_id": args.paper_id, "doi": args.doi,
             "zenodo_record": args.zenodo_id, "today": TODAY,
             "action": None, "entry_index": idx, "changes": None,
             "total_papers_before": manifest.get("_meta", {}).get("total_papers"),
             "total_papers_after": None}

    if idx >= 0:
        changes = _mark_published(manifest["papers"][idx], doi=args.doi,
                                  zenodo_id=args.zenodo_id)
        delta["action"] = "updated"
        delta["changes"] = changes
        delta["total_papers_after"] = delta["total_papers_before"]
    else:
        # insert stub
        if not args.paper_id:
            print("[MANIFEST] ERROR: --paper-id required to insert new entry",
                  file=sys.stderr)
            return 1
        stub = {
            "id": args.paper_id,
            "title": args.title or args.paper_id,
            "repo": args.repo or "papers",
            "file": args.file or "",
            "status": "Published",
            "doi": args.doi,
            "zenodo_doi": args.doi,
            "zenodo_record": str(args.zenodo_id),
            "date": TODAY,
            "published_at": TODAY,
            "tier": 3,
            "keywords": [],
            "abstract_first_line": "",
            "upload_source": "pp3_hook_" + TODAY.replace("-", ""),
        }
        manifest.setdefault("papers", []).append(stub)
        # bump totals
        meta = manifest.setdefault("_meta", {})
        metadata = manifest.setdefault("metadata", {})
        new_total = len(manifest["papers"])
        meta["total_papers"] = new_total
        meta["updated"] = TODAY
        metadata["total_papers"] = new_total
        delta["action"] = "inserted"
        delta["changes"] = {"stub": stub}
        delta["total_papers_after"] = new_total

    # _meta.updated bump whether insert or update
    manifest.setdefault("_meta", {})["updated"] = TODAY

    if args.dry_run:
        print(json.dumps(delta, ensure_ascii=False, indent=2))
        print("[MANIFEST] DRY RUN -- no disk write", file=sys.stderr)
        return 0

    _atomic_write(MANIFEST_PATH, manifest)
    print(json.dumps(delta, ensure_ascii=False, indent=2))
    return 0


# --- reconcile ---------------------------------------------------------------

_DOI_RE = re.compile(r"10\.5281/zenodo\.(\d+)")
_LABEL_RE = re.compile(r"\|\s*([A-Z][A-Z0-9\-]+)\s*\|")
_PAPER_N_RE = re.compile(r"PAPER-(\d+)\s*\|\s*([A-Za-z0-9_\-]+)\s*\|")
_OSF_RE = re.compile(r"osf\.io/([a-z0-9]+)")


def _parse_upload_logs() -> list:
    """Extract (label_or_hint, doi, record_id, osf_id, source_file) tuples."""
    out = []
    for fn in sorted(os.listdir(REPO_ROOT)):
        if not fn.startswith("upload_results_") or not fn.endswith(".txt"):
            continue
        path = os.path.join(REPO_ROOT, fn)
        try:
            with open(path, "r", encoding="utf-8", errors="replace") as fh:
                text = fh.read()
        except OSError:
            continue
        # Strategy A: table-style rows "| LABEL | title | [zenodo.ID] | osf.io/X"
        for line in text.splitlines():
            m_doi = _DOI_RE.search(line)
            if not m_doi:
                continue
            label_m = _LABEL_RE.search(line)
            osf_m = _OSF_RE.search(line)
            if label_m:
                out.append({
                    "label": label_m.group(1),
                    "doi": "10.5281/zenodo." + m_doi.group(1),
                    "record_id": m_doi.group(1),
                    "osf_id": osf_m.group(1) if osf_m else None,
                    "source_log": fn,
                    "source_kind": "table",
                })
        # Strategy B: shell-style rows "PAPER-N | hint | DOI..."
        for m in _PAPER_N_RE.finditer(text):
            # find nearest DOI within same line / following lines
            # simple: locate this match's line index, look forward 4 lines
            start = m.start()
            tail = text[start:start + 800]
            m_doi = _DOI_RE.search(tail)
            if not m_doi:
                continue
            m_osf = _OSF_RE.search(tail)
            out.append({
                "label": None,
                "hint": m.group(2),
                "doi": "10.5281/zenodo." + m_doi.group(1),
                "record_id": m_doi.group(1),
                "osf_id": m_osf.group(1) if m_osf else None,
                "source_log": fn,
                "source_kind": "paper_n",
            })
    return out


def _match_log_to_entry(manifest: dict, log: dict) -> int:
    papers = manifest.get("papers", [])
    # prefer zenodo record id match
    rec = log["record_id"]
    for i, p in enumerate(papers):
        for key in ("zenodo_record", "zenodo_doi", "doi"):
            v = p.get(key, "") or ""
            if rec in str(v):
                return i
    # next: label match (e.g., PA-11, N6-FUSION-1)
    lbl = log.get("label")
    if lbl:
        for i, p in enumerate(papers):
            pid = p.get("id", "")
            # PA-11b <-> PA-11 variant tolerance
            if pid == lbl:
                return i
            if pid.startswith(lbl) or lbl.startswith(pid):
                return i
    return -1


def cmd_reconcile(args) -> int:
    manifest = _load_manifest()
    logs = _parse_upload_logs()
    delta = {"mode": "reconcile", "logs_parsed": len(logs),
             "entries_updated": 0, "entries_inserted": 0, "no_match": 0,
             "already_published": 0, "details": []}

    for log in logs:
        idx = _match_log_to_entry(manifest, log)
        if idx < 0:
            delta["no_match"] += 1
            delta["details"].append({"log": log, "action": "no_match"})
            continue
        entry = manifest["papers"][idx]
        # idempotency rule: an entry that already has ANY doi field AND
        # Published status is considered absorbed. We only fill GAPS:
        #   - missing zenodo_record (reconcile the record id)
        #   - missing published_at (backfill the date)
        #   - missing osf_id (enrich)
        # We DO NOT overwrite an existing non-empty doi with a log-derived
        # one (different upload batches produce different DOIs -- manifest
        # is SSOT for the "current" DOI).
        has_doi = bool(entry.get("doi") or entry.get("zenodo_doi"))
        is_published = entry.get("status") in ("Published", "published")
        needs_record = not entry.get("zenodo_record")
        needs_published_at = not entry.get("published_at")
        needs_osf = bool(log.get("osf_id")) and not entry.get("osf_id")
        # match must also agree on record id (otherwise cross-contaminate)
        record_matches = log["record_id"] in str(entry.get("zenodo_record", "")) \
            or log["record_id"] in str(entry.get("doi", "")) \
            or log["record_id"] in str(entry.get("zenodo_doi", ""))

        if has_doi and is_published and not (needs_record or needs_published_at or needs_osf):
            delta["already_published"] += 1
            continue

        # gap-fill only when record matches; if DOIs diverge, leave untouched
        if has_doi and not record_matches:
            # Log-derived DOI differs from manifest DOI; conservative: skip.
            delta["no_match"] += 1
            delta["details"].append({
                "log": log, "action": "skipped_doi_divergence",
                "entry_id": entry.get("id"),
                "manifest_doi": entry.get("doi") or entry.get("zenodo_doi"),
            })
            continue

        before = {k: entry.get(k) for k in ("zenodo_record", "published_at",
                                            "osf_id", "status",
                                            "doi", "zenodo_doi")}
        if needs_record:
            entry["zenodo_record"] = log["record_id"]
        if needs_published_at:
            entry["published_at"] = TODAY
        if not is_published:
            entry["status"] = "Published"
        if not has_doi:
            entry["doi"] = log["doi"]
            entry["zenodo_doi"] = log["doi"]
        if needs_osf:
            entry["osf_id"] = log["osf_id"]
        after = {k: entry.get(k) for k in ("zenodo_record", "published_at",
                                           "osf_id", "status",
                                           "doi", "zenodo_doi")}
        delta["entries_updated"] += 1
        delta["details"].append({"log": log, "action": "gap_filled",
                                 "entry_id": entry.get("id"),
                                 "changes": {"before": before, "after": after}})

    if delta["entries_updated"] > 0 or delta["entries_inserted"] > 0:
        manifest.setdefault("_meta", {})["updated"] = TODAY

    if args.dry_run:
        print(json.dumps(delta, ensure_ascii=False, indent=2))
        print("[MANIFEST] DRY RUN -- no disk write", file=sys.stderr)
        return 0

    if delta["entries_updated"] > 0 or delta["entries_inserted"] > 0:
        _atomic_write(MANIFEST_PATH, manifest)

    # Always print summary
    summary = {k: delta[k] for k in ("mode", "logs_parsed", "entries_updated",
                                     "entries_inserted", "no_match",
                                     "already_published")}
    print(json.dumps(summary, ensure_ascii=False, indent=2))
    return 0


def main(argv=None):
    p = argparse.ArgumentParser(description="manifest.json PP3 update hook")
    sub = p.add_subparsers(dest="cmd", required=True)

    up = sub.add_parser("update", help="update or insert a single paper entry")
    up.add_argument("--paper-id", required=True)
    up.add_argument("--doi", required=True, help="e.g. 10.5281/zenodo.12345")
    up.add_argument("--zenodo-id", required=True, help="numeric id")
    up.add_argument("--file", default=None, help="relative path to paper .md")
    up.add_argument("--title", default=None)
    up.add_argument("--repo", default=None)
    up.add_argument("--dry-run", action="store_true")
    up.set_defaults(func=cmd_update)

    rc = sub.add_parser("reconcile",
                        help="scan upload_results_*.txt and fill in gaps")
    rc.add_argument("--dry-run", action="store_true")
    rc.set_defaults(func=cmd_reconcile)

    args = p.parse_args(argv)
    try:
        return args.func(args)
    except FileNotFoundError as e:
        print("[MANIFEST] IO ERROR: " + str(e), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
