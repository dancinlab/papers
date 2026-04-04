#!/usr/bin/env python3
"""
verify_dois.py — Verify all DOI/Zenodo links in README.md are reachable.

Parses README.md for DOI and Zenodo URLs, makes HTTP HEAD requests to check
each link, and reports broken/redirected/missing links.

Usage:
    python3 scripts/verify_dois.py
    python3 scripts/verify_dois.py --verbose
    python3 scripts/verify_dois.py --timeout 10
"""

import argparse
import os
import re
import sys
import time
import urllib.error
import urllib.request

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
README_PATH = os.path.join(REPO_ROOT, "README.md")

# Rate-limit between requests (seconds)
REQUEST_DELAY = 0.5


def extract_all_links(readme_path):
    """Extract all DOI and Zenodo URLs from README.md, grouped by paper."""
    with open(readme_path, "r", encoding="utf-8") as f:
        content = f.read()

    links = []

    # --- Zenodo DOI links from tables ---
    # Pattern: | P-ID | Title | [zenodo.ID](URL) | ...
    table_pattern = re.compile(
        r"\|\s*\**([A-Z]+-[\w]+(?:-[\w]+)*)\**\s*\|"     # paper ID
        r"\s*\**([^|]+?)\**\s*\|"               # title
        r"\s*\[zenodo\.(\d+)\]"                  # zenodo record
        r"\((https?://[^)]+)\)"                  # URL
    )
    for m in table_pattern.finditer(content):
        links.append({
            "paper_id": m.group(1).strip(),
            "title": m.group(2).strip(),
            "record_id": m.group(3).strip(),
            "url": m.group(4).strip(),
            "type": "zenodo_doi",
        })

    # --- OSF links from tables ---
    osf_pattern = re.compile(
        r"\|\s*\**([A-Z]+-[\w]+(?:-[\w]+)*)\**\s*\|"     # paper ID
        r"[^|]+\|"                               # title
        r"[^|]+\|"                               # zenodo column
        r"\s*\[osf\.io/(\w+)\]"                  # osf ID
        r"\((https?://[^)]+)\)"                  # URL
    )
    for m in osf_pattern.finditer(content):
        links.append({
            "paper_id": m.group(1).strip(),
            "osf_id": m.group(2).strip(),
            "url": m.group(3).strip(),
            "type": "osf",
        })

    # --- Standalone DOI links (e.g., collection DOI) ---
    doi_pattern = re.compile(
        r"\[10\.5281/zenodo\.(\d+)\]\((https?://[^)]+)\)"
    )
    for m in doi_pattern.finditer(content):
        # Avoid duplicates already captured in tables
        url = m.group(2).strip()
        if not any(l["url"] == url for l in links):
            links.append({
                "paper_id": "COLLECTION",
                "record_id": m.group(1).strip(),
                "url": url,
                "type": "zenodo_doi",
            })

    return links


def check_url(url, timeout=10):
    """
    Check if a URL is reachable using HEAD request, fallback to GET.
    Returns (status_code, final_url, error_message).
    """
    # Use a custom opener that does NOT follow redirects automatically
    # so we can detect 301/302
    class NoRedirectHandler(urllib.request.HTTPRedirectHandler):
        def redirect_request(self, req, fp, code, msg, headers, newurl):
            return None  # stop redirect

    opener = urllib.request.build_opener(NoRedirectHandler)

    headers = {
        "User-Agent": "papers-doi-verifier/1.0 (https://github.com/need-singularity/papers)",
        "Accept": "text/html,application/json",
    }

    # Try HEAD first
    for method in ["HEAD", "GET"]:
        try:
            req = urllib.request.Request(url, headers=headers, method=method)
            resp = opener.open(req, timeout=timeout)
            return (resp.status, url, None)
        except urllib.error.HTTPError as e:
            if e.code in (301, 302, 303, 307, 308):
                location = e.headers.get("Location", "unknown")
                return (e.code, location, None)
            if e.code == 429:
                return (429, url, "Rate limited — retry later")
            if method == "HEAD" and e.code in (403, 405):
                # Some servers reject HEAD, try GET
                continue
            return (e.code, url, str(e.reason))
        except urllib.error.URLError as e:
            return (0, url, f"URL error: {e.reason}")
        except Exception as e:
            return (0, url, str(e))

    return (0, url, "All methods failed")


def analyze_count_mismatch(readme_path):
    """Check for the claimed vs tracked paper count mismatch."""
    with open(readme_path, "r", encoding="utf-8") as f:
        content = f.read()

    findings = []

    # Header total
    header_match = re.search(r"\*\*Total:\s*(\d+)\s*papers\*\*", content)
    header_total = int(header_match.group(1)) if header_match else None

    # Project description count (the "94 papers" reference)
    desc_match = re.search(r"\((\d+)\s*papers\)", content)
    desc_total = int(desc_match.group(1)) if desc_match else None

    # Section breakdowns
    section_pattern = re.compile(r"(TECS-L|anima|SEDI):\s*(\d+)\s*papers")
    sections = {m.group(1): int(m.group(2)) for m in section_pattern.finditer(content)}
    section_sum = sum(sections.values()) if sections else None

    # Count actual table entries
    table_entries = re.findall(
        r"\|\s*\**[A-Z]+-[\w]+\**\s*\|[^|]+\|\s*\[zenodo\.\d+\]",
        content,
    )
    actual_count = len(table_entries)

    # Statistics table
    stats_match = re.search(r"Total papers\s*\|\s*(\d+)", content)
    stats_total = int(stats_match.group(1)) if stats_match else None

    findings.append(f"Project description count: {desc_total}")
    findings.append(f"README header total:       {header_total}")
    findings.append(f"Section breakdown:         {sections} = {section_sum}")
    findings.append(f"Statistics table total:    {stats_total}")
    findings.append(f"Actual table entries:      {actual_count}")

    # Detect specific mismatches
    numbers = {
        "desc": desc_total,
        "header": header_total,
        "sections": section_sum,
        "stats": stats_total,
        "actual": actual_count,
    }
    unique_vals = set(v for v in numbers.values() if v is not None)
    if len(unique_vals) > 1:
        findings.append(f"\nMISMATCH DETECTED: Different counts found: {unique_vals}")
        for name, val in numbers.items():
            if val is not None and val != actual_count:
                findings.append(f"  {name} says {val} but actual table has {actual_count}")

    return findings


def main():
    parser = argparse.ArgumentParser(
        description="Verify all DOI/Zenodo links in README.md"
    )
    parser.add_argument(
        "--verbose", "-v", action="store_true",
        help="Show status for each link"
    )
    parser.add_argument(
        "--timeout", type=int, default=10,
        help="HTTP request timeout in seconds (default: 10)"
    )
    parser.add_argument(
        "--skip-osf", action="store_true",
        help="Skip OSF link checks (only verify Zenodo DOIs)"
    )
    parser.add_argument(
        "--limit", type=int, default=0,
        help="Limit number of links to check (0 = all)"
    )
    args = parser.parse_args()

    print(f"Parsing {README_PATH} ...")
    all_links = extract_all_links(README_PATH)

    zenodo_links = [l for l in all_links if l["type"] == "zenodo_doi"]
    osf_links = [l for l in all_links if l["type"] == "osf"]

    print(f"  Zenodo DOI links: {len(zenodo_links)}")
    print(f"  OSF links:        {len(osf_links)}")
    print(f"  Total links:      {len(all_links)}")

    # --- Count mismatch analysis ---
    print(f"\n{'='*60}")
    print("PAPER COUNT ANALYSIS")
    print(f"{'='*60}")
    for finding in analyze_count_mismatch(README_PATH):
        print(f"  {finding}")

    # --- Link verification ---
    links_to_check = all_links
    if args.skip_osf:
        links_to_check = zenodo_links
        print(f"\nSkipping OSF links (--skip-osf)")

    if args.limit > 0:
        links_to_check = links_to_check[: args.limit]

    print(f"\n{'='*60}")
    print(f"VERIFYING {len(links_to_check)} LINKS")
    print(f"{'='*60}")

    alive = []
    redirects = []
    dead = []
    rate_limited = []

    for i, link in enumerate(links_to_check):
        url = link["url"]
        paper_id = link.get("paper_id", "?")
        link_type = link["type"]

        if args.verbose:
            print(f"  [{i+1}/{len(links_to_check)}] {paper_id} ({link_type}) {url} ... ", end="", flush=True)

        status, final_url, error = check_url(url, timeout=args.timeout)

        result = {**link, "status": status, "final_url": final_url, "error": error}

        if status == 429:
            rate_limited.append(result)
            if args.verbose:
                print("RATE LIMITED")
        elif status in (200, 204):
            alive.append(result)
            if args.verbose:
                print(f"OK ({status})")
        elif status in (301, 302, 303, 307, 308):
            redirects.append(result)
            if args.verbose:
                print(f"REDIRECT ({status}) -> {final_url}")
        else:
            dead.append(result)
            if args.verbose:
                err_msg = f" ({error})" if error else ""
                print(f"DEAD ({status}){err_msg}")

        # Rate limit
        if i < len(links_to_check) - 1:
            time.sleep(REQUEST_DELAY)

    # --- Summary ---
    print(f"\n{'='*60}")
    print("VERIFICATION SUMMARY")
    print(f"{'='*60}")
    print(f"  Total checked:   {len(links_to_check)}")
    print(f"  Alive (200):     {len(alive)}")
    print(f"  Redirects (3xx): {len(redirects)}")
    print(f"  Dead/Error:      {len(dead)}")
    print(f"  Rate limited:    {len(rate_limited)}")

    # DOI links specifically expect redirects (doi.org -> zenodo.org)
    zenodo_redirects = [r for r in redirects if r["type"] == "zenodo_doi"]
    if zenodo_redirects:
        print(f"\n  Note: {len(zenodo_redirects)} Zenodo DOI redirects are EXPECTED")
        print(f"  (doi.org redirects to zenodo.org — this is normal)")

    # Report dead links
    if dead:
        print(f"\n--- DEAD / UNREACHABLE LINKS ---")
        for d in dead:
            err = f" — {d['error']}" if d.get("error") else ""
            print(f"  {d.get('paper_id', '?')} ({d['type']}): {d['url']} [HTTP {d['status']}]{err}")

    # Report rate-limited
    if rate_limited:
        print(f"\n--- RATE LIMITED (retry later) ---")
        for r in rate_limited:
            print(f"  {r.get('paper_id', '?')}: {r['url']}")

    # Check for papers in README but not having Zenodo DOI
    with open(README_PATH, "r", encoding="utf-8") as f:
        readme = f.read()
    # Papers that might be in tables but without zenodo links
    all_paper_ids = re.findall(r"\|\s*\**([A-Z]+-[\w]+(?:-[\w]+)*)\**\s*\|", readme)
    zenodo_paper_ids = {l["paper_id"] for l in zenodo_links}
    missing = [pid for pid in all_paper_ids if pid not in zenodo_paper_ids and pid not in ("#", "")]
    if missing:
        print(f"\n--- PAPERS WITHOUT ZENODO DOI ---")
        for pid in missing:
            print(f"  {pid}")

    # Exit code
    if dead:
        sys.exit(1)
    sys.exit(0)


if __name__ == "__main__":
    main()
