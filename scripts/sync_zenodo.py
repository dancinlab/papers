#!/usr/bin/env python3
"""
sync_zenodo.py — Fetch metadata from Zenodo API and sync with local tracking.

Reads DOIs/record IDs from README.md and manifest.json, fetches current
metadata from Zenodo, and reports mismatches. Optionally updates a local
metadata cache file.

Usage:
    python3 scripts/sync_zenodo.py              # full sync, writes metadata.json
    python3 scripts/sync_zenodo.py --dry-run    # preview only, no file writes
    python3 scripts/sync_zenodo.py --verbose     # show per-record details
"""

import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request
from datetime import datetime, timezone

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
README_PATH = os.path.join(REPO_ROOT, "README.md")
MANIFEST_PATH = os.path.join(REPO_ROOT, "manifest.json")
METADATA_OUT = os.path.join(REPO_ROOT, "zenodo_metadata.json")

ZENODO_API = "https://zenodo.org/api/records/{record_id}"

# Rate-limit: be polite to Zenodo (max ~1 req/sec)
REQUEST_DELAY = 1.0


def extract_zenodo_ids_from_readme(readme_path):
    """Parse README.md and extract all Zenodo record IDs with their paper IDs."""
    entries = []
    with open(readme_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Match table rows like: | P-001 | Title | [zenodo.19245023](https://doi.org/10.5281/zenodo.19245023) |
    # Paper IDs can be P-001, PA-01, PS-01, P-NEW-1, P-HEXA, etc.
    pattern = re.compile(
        r"\|\s*\**([A-Z]+-[\w]+(?:-[\w]+)*)\**\s*\|"  # paper ID (handles P-NEW-1 etc.)
        r"\s*\**([^|]+?)\**\s*\|"                       # title
        r"\s*\[zenodo\.(\d+)\]"                         # zenodo record ID
    )
    for m in pattern.finditer(content):
        paper_id = m.group(1).strip()
        title = m.group(2).strip()
        record_id = m.group(3).strip()
        entries.append({
            "paper_id": paper_id,
            "local_title": title,
            "record_id": record_id,
            "doi": f"10.5281/zenodo.{record_id}",
        })

    return entries


def extract_zenodo_ids_from_manifest(manifest_path):
    """Parse manifest.json for DOI/record info."""
    if not os.path.exists(manifest_path):
        return {}
    with open(manifest_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    manifest_map = {}
    for paper in data.get("papers", []):
        doi = paper.get("doi", "")
        m = re.search(r"zenodo\.(\d+)", doi)
        if m:
            manifest_map[m.group(1)] = {
                "id": paper.get("id"),
                "title": paper.get("title"),
                "date": paper.get("date"),
                "status": paper.get("status"),
            }
    return manifest_map


def fetch_zenodo_record(record_id):
    """Fetch metadata for a single Zenodo record. Returns dict or None."""
    url = ZENODO_API.format(record_id=record_id)
    req = urllib.request.Request(url, headers={"Accept": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = json.loads(resp.read().decode("utf-8"))
        return {
            "record_id": str(data.get("id", record_id)),
            "doi": data.get("doi", ""),
            "title": data.get("metadata", {}).get("title", ""),
            "publication_date": data.get("metadata", {}).get("publication_date", ""),
            "creators": [
                c.get("name", "") for c in data.get("metadata", {}).get("creators", [])
            ],
            "license": data.get("metadata", {}).get("license", {}).get("id", ""),
            "access_right": data.get("metadata", {}).get("access_right", ""),
            "version": data.get("metadata", {}).get("version", ""),
            "views": data.get("stats", {}).get("views", 0),
            "downloads": data.get("stats", {}).get("downloads", 0),
            "fetched_at": datetime.now(timezone.utc).isoformat(),
        }
    except urllib.error.HTTPError as e:
        return {"record_id": record_id, "error": f"HTTP {e.code}: {e.reason}"}
    except urllib.error.URLError as e:
        return {"record_id": record_id, "error": f"URL error: {e.reason}"}
    except Exception as e:
        return {"record_id": record_id, "error": str(e)}


def compare_metadata(local_entry, zenodo_data, manifest_info=None):
    """Compare local tracking data with Zenodo API response. Return list of mismatches."""
    mismatches = []
    if "error" in zenodo_data:
        mismatches.append(f"  FETCH ERROR: {zenodo_data['error']}")
        return mismatches

    # Title mismatch
    zen_title = zenodo_data.get("title", "")
    local_title = local_entry.get("local_title", "")
    if local_title and zen_title and local_title.lower() != zen_title.lower():
        # Check if local is a substring (short titles in table)
        if local_title.lower() not in zen_title.lower():
            mismatches.append(
                f"  TITLE MISMATCH:\n"
                f"    local:  {local_title}\n"
                f"    zenodo: {zen_title}"
            )

    # DOI mismatch
    zen_doi = zenodo_data.get("doi", "")
    local_doi = local_entry.get("doi", "")
    if local_doi and zen_doi and local_doi != zen_doi:
        mismatches.append(f"  DOI MISMATCH: local={local_doi}, zenodo={zen_doi}")

    # Manifest date mismatch
    if manifest_info:
        man_date = manifest_info.get("date", "")
        zen_date = zenodo_data.get("publication_date", "")
        if man_date and zen_date and man_date != zen_date:
            mismatches.append(
                f"  DATE MISMATCH: manifest={man_date}, zenodo={zen_date}"
            )

    return mismatches


def main():
    parser = argparse.ArgumentParser(
        description="Sync paper metadata from Zenodo API"
    )
    parser.add_argument(
        "--dry-run", action="store_true",
        help="Preview changes without writing files"
    )
    parser.add_argument(
        "--verbose", "-v", action="store_true",
        help="Show per-record fetch details"
    )
    parser.add_argument(
        "--limit", type=int, default=0,
        help="Limit number of records to fetch (0 = all, useful for testing)"
    )
    args = parser.parse_args()

    # --- Parse local sources ---
    print(f"Reading {README_PATH} ...")
    readme_entries = extract_zenodo_ids_from_readme(README_PATH)
    print(f"  Found {len(readme_entries)} papers with Zenodo IDs in README.md")

    manifest_map = extract_zenodo_ids_from_manifest(MANIFEST_PATH)
    print(f"  Found {len(manifest_map)} papers in manifest.json")

    if not readme_entries:
        print("ERROR: No Zenodo entries found in README.md")
        sys.exit(1)

    # --- Detect count mismatches ---
    # README header says "Total: 92 papers" -- check against actual table rows
    with open(README_PATH, "r", encoding="utf-8") as f:
        readme_text = f.read()

    claimed_match = re.search(r"\*\*Total:\s*(\d+)\s*papers\*\*", readme_text)
    claimed_total = int(claimed_match.group(1)) if claimed_match else None

    # Section counts
    section_counts = re.findall(
        r"(TECS-L|anima|SEDI):\s*(\d+)\s*papers", readme_text
    )
    section_sum = sum(int(c) for _, c in section_counts) if section_counts else None

    print(f"\n--- Count Analysis ---")
    print(f"  README claimed total: {claimed_total}")
    print(f"  Section breakdown sum: {section_sum}")
    print(f"  Actual table entries:  {len(readme_entries)}")
    print(f"  Manifest entries:      {len(manifest_map)}")
    if claimed_total and claimed_total != len(readme_entries):
        print(f"  WARNING: Claimed {claimed_total} but found {len(readme_entries)} in tables")
    if section_sum and section_sum != len(readme_entries):
        print(f"  WARNING: Section sum {section_sum} != table entries {len(readme_entries)}")

    # Also check the "94 claimed" from project description
    desc_94 = re.search(r"\((\d+)\s*papers\)", readme_text)
    if desc_94:
        desc_count = int(desc_94.group(1))
        if desc_count != len(readme_entries):
            print(f"  WARNING: Project description says {desc_count} but {len(readme_entries)} tracked")

    # --- Fetch from Zenodo API ---
    entries_to_fetch = readme_entries
    if args.limit > 0:
        entries_to_fetch = entries_to_fetch[: args.limit]

    print(f"\nFetching {len(entries_to_fetch)} records from Zenodo API ...")
    if args.dry_run:
        print("  (DRY RUN: will not write any files)\n")

    results = []
    mismatches_found = 0
    errors_found = 0

    for i, entry in enumerate(entries_to_fetch):
        record_id = entry["record_id"]
        paper_id = entry["paper_id"]

        if args.verbose:
            print(f"  [{i+1}/{len(entries_to_fetch)}] {paper_id} -> zenodo.{record_id} ... ", end="", flush=True)

        zenodo_data = fetch_zenodo_record(record_id)

        if "error" in zenodo_data:
            errors_found += 1
            if args.verbose:
                print(f"ERROR: {zenodo_data['error']}")
        else:
            if args.verbose:
                print(f"OK ({zenodo_data.get('views', 0)} views, {zenodo_data.get('downloads', 0)} downloads)")

        # Compare
        manifest_info = manifest_map.get(record_id)
        diffs = compare_metadata(entry, zenodo_data, manifest_info)
        if diffs:
            mismatches_found += 1

        results.append({
            "paper_id": paper_id,
            "record_id": record_id,
            "local_title": entry["local_title"],
            "zenodo": zenodo_data,
            "mismatches": diffs,
        })

        # Rate limit
        if i < len(entries_to_fetch) - 1:
            time.sleep(REQUEST_DELAY)

    # --- Report ---
    print(f"\n{'='*60}")
    print(f"SYNC REPORT")
    print(f"{'='*60}")
    print(f"  Total fetched:   {len(results)}")
    print(f"  Successful:      {len(results) - errors_found}")
    print(f"  Errors:          {errors_found}")
    print(f"  Mismatches:      {mismatches_found}")

    # Show mismatches
    if mismatches_found > 0:
        print(f"\n--- Mismatches ---")
        for r in results:
            if r["mismatches"]:
                print(f"\n{r['paper_id']} (zenodo.{r['record_id']}):")
                for m in r["mismatches"]:
                    print(m)

    # Show errors
    if errors_found > 0:
        print(f"\n--- Errors ---")
        for r in results:
            zen = r["zenodo"]
            if "error" in zen:
                print(f"  {r['paper_id']} (zenodo.{r['record_id']}): {zen['error']}")

    # --- Aggregate stats ---
    total_views = sum(
        r["zenodo"].get("views", 0) for r in results if "error" not in r["zenodo"]
    )
    total_downloads = sum(
        r["zenodo"].get("downloads", 0) for r in results if "error" not in r["zenodo"]
    )
    print(f"\n--- Aggregate Stats ---")
    print(f"  Total views:     {total_views}")
    print(f"  Total downloads: {total_downloads}")

    # --- Write metadata file ---
    if not args.dry_run:
        output = {
            "_meta": {
                "description": "Zenodo metadata cache — auto-generated by sync_zenodo.py",
                "synced_at": datetime.now(timezone.utc).isoformat(),
                "total_records": len(results),
                "errors": errors_found,
                "mismatches": mismatches_found,
            },
            "stats": {
                "total_views": total_views,
                "total_downloads": total_downloads,
            },
            "records": results,
        }
        with open(METADATA_OUT, "w", encoding="utf-8") as f:
            json.dump(output, f, indent=2, ensure_ascii=False)
        print(f"\nMetadata written to {METADATA_OUT}")
    else:
        print(f"\nDRY RUN: Would write metadata to {METADATA_OUT}")

    # Return exit code
    sys.exit(1 if errors_found > 0 else 0)


if __name__ == "__main__":
    main()
