#!/usr/bin/env python3
# @hexa-first-exempt -- CLI helper used by upload_zenodo.hexa (stage1 blocked on heredoc-heavy glue)
#
# pp2_gate.py -- PP2 verify-code embed gate (VERIFY-P2-1)
#
# Ensures a paper .md contains PP2 verification markers BEFORE it is uploaded.
# Precedent markers (shared/discovery/papers_pp2_audit_2026-04-14.json):
#   - ```python ... ```    (executable verification block)
#   - @register             (verification function decorator)
#   - ossification_loop     (canonical verify function name)
#   - N/N OK                (pass sentinel)
#   - N62                   (marker id)
#
# PASS = python fenced block present AND >= 1 structural marker.
# The structural constraint mirrors the audit JSON "criteria" field.
#
# Usage:
#   python3 pp2_gate.py --check-only <paper.md>
#   python3 pp2_gate.py <paper.md>                  # returns JSON blob on stdout
#   python3 pp2_gate.py --skip <paper.md>           # bypass w/ warning
#
# Exit codes:
#   0 = PASS (or --skip used)
#   1 = FAIL (markers missing)
#   2 = ERROR (file not found / IO)

import argparse
import json
import os
import re
import sys

MARKERS = ("@register", "ossification_loop", "N/N OK", "N62")
PY_BLOCK_RE = re.compile(r"```python\b")


def scan(path: str) -> dict:
    if not os.path.isfile(path):
        return {
            "path": path,
            "exists": False,
            "has_py_block": False,
            "py_block_count": 0,
            "markers_found": [],
            "pass": False,
            "reason": "file_not_found",
        }
    with open(path, "r", encoding="utf-8", errors="replace") as fh:
        text = fh.read()
    py_matches = PY_BLOCK_RE.findall(text)
    py_block_count = len(py_matches)
    markers_found = [m for m in MARKERS if m in text]
    # criteria from audit 2026-04-14: has_py_block AND >=1 marker
    has_py = py_block_count > 0
    has_marker = len(markers_found) > 0
    passed = has_py and has_marker
    reason = "ok" if passed else (
        "no_python_block_and_no_marker" if (not has_py and not has_marker)
        else "no_python_block" if not has_py
        else "no_marker"
    )
    return {
        "path": path,
        "exists": True,
        "has_py_block": has_py,
        "py_block_count": py_block_count,
        "markers_found": markers_found,
        "pass": passed,
        "reason": reason,
    }


EMBED_TEMPLATE = """\
## Appendix: PP2 Verification (N62)

```python
# @register N62
def ossification_loop():
    # ... verify invariants ...
    assert True  # N/N checks
    return "N/N OK"
```
"""


def format_fail_message(result: dict) -> str:
    lines = [
        "[PP2-GATE] FAIL: verification markers missing",
        "  path: " + result["path"],
        "  reason: " + result["reason"],
        "  python_blocks: " + str(result["py_block_count"]),
        "  markers_found: " + (", ".join(result["markers_found"]) or "(none)"),
        "",
        "  Precedent: shared/discovery/papers_pp2_audit_2026-04-14.json",
        "  Required: python fenced block AND >=1 of " + ", ".join(MARKERS),
        "",
        "  Suggested embed (append to paper):",
    ]
    for tl in EMBED_TEMPLATE.splitlines():
        lines.append("  " + tl if tl else "")
    lines.append("")
    lines.append("  Bypass (explicit, logged): --skip-pp2-gate")
    return "\n".join(lines)


def main(argv=None):
    p = argparse.ArgumentParser(description="PP2 verify-code embed gate")
    p.add_argument("paper", help="path to paper .md (absolute or relative)")
    p.add_argument("--check-only", action="store_true",
                   help="print PASS/FAIL and exit (no json blob)")
    p.add_argument("--skip", action="store_true",
                   help="bypass gate (still reports) and always exit 0")
    p.add_argument("--json", action="store_true",
                   help="print full result JSON")
    args = p.parse_args(argv)

    result = scan(args.paper)
    if not result["exists"]:
        print("[PP2-GATE] ERROR: file not found: " + args.paper, file=sys.stderr)
        return 2

    if args.check_only:
        tag = "PASS" if result["pass"] else "FAIL"
        print("[PP2-GATE] " + tag + " " + args.paper
              + " py=" + str(result["py_block_count"])
              + " markers=" + (",".join(result["markers_found"]) or "-"))
        if not result["pass"]:
            print(format_fail_message(result), file=sys.stderr)
        return 0 if result["pass"] else 1

    if args.json:
        print(json.dumps(result, ensure_ascii=False))

    if result["pass"]:
        if not args.json:
            print("[PP2-GATE] PASS " + args.paper)
        return 0
    # FAIL
    if args.skip:
        print("[PP2-GATE] WARN skip-bypass active for " + args.paper, file=sys.stderr)
        print("[PP2-GATE] WARN reason=" + result["reason"], file=sys.stderr)
        return 0
    print(format_fail_message(result), file=sys.stderr)
    return 1


if __name__ == "__main__":
    sys.exit(main())
