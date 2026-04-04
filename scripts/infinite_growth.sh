#!/usr/bin/env bash
set -euo pipefail

GROWTH_NAME="papers"
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DOMAIN="publication"
MAX_CYCLES=${MAX_CYCLES:-${1:-999}}
INTERVAL=${INTERVAL:-${2:-1800}}

COMMON="$HOME/Dev/nexus6/scripts/lib/growth_common.sh"
source "$COMMON"

domain_phases() {
    local cycle="$1" load="$2"

    # Phase 1: 논문 수
    local pdf_count tex_count
    pdf_count=$(find "$PROJECT_ROOT" -name '*.pdf' 2>/dev/null | wc -l | tr -d ' ')
    tex_count=$(find "$PROJECT_ROOT" -name '*.tex' 2>/dev/null | wc -l | tr -d ' ')
    log_info "Phase[paper_count] pdf=$pdf_count tex=$tex_count"
    write_growth_bus "paper_count" "ok" "pdf=$pdf_count,tex=$tex_count"

    # Phase 2: Atlas 참조
    local atlas_file="$PROJECT_ROOT/.shared/math_atlas.json"
    if [ -f "$atlas_file" ]; then
        log_info "Phase[atlas_ref] math_atlas.json exists"
        write_growth_bus "atlas_ref" "ok"
    else
        log_warn "Phase[atlas_ref] math_atlas.json missing"
        write_growth_bus "atlas_ref" "warn" "file_missing"
    fi

    # Phase 3: DOI 링크 상태
    local doi_count=0
    if [ -f "$PROJECT_ROOT/README.md" ]; then
        doi_count=$(grep -c 'doi\.org' "$PROJECT_ROOT/README.md" 2>/dev/null || echo 0)
    fi
    log_info "Phase[doi_links] doi.org link count: $doi_count"
    write_growth_bus "doi_links" "ok" "count=$doi_count"

    # Phase 4: 성장 스캔
    if [ -f "$PROJECT_ROOT/.growth/scan.py" ]; then
        log_info "Phase[growth_scan] running .growth/scan.py"
        python3 "$PROJECT_ROOT/.growth/scan.py" >> "$GROWTH_LOG" 2>&1 || true
        write_growth_bus "growth_scan" "ok"
    else
        log_info "Phase[growth_scan] .growth/scan.py not found — skip"
        write_growth_bus "growth_scan" "skip" "no_scan_script"
    fi
}

run_growth_loop "domain_phases"
