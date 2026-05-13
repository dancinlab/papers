# TAPE-AUDIT — papers

## A. Audit-class ledgers

Moderate cargo surface; all design-flavored (publication pipeline).
- **CARGO-ledger (migrate to `.tape`)**:
  - `state/markers/` — 240 KB of hexa hook markers.
  - `state/doi_pull_audit/`, `keyword_search_audit/`, `manifest_update_audit/`, `osf_publish_audit/`, `papers_cross_repo_audit/`, `papers_lint_audit/`, `pp2_gate_audit/` — **all 0-byte stub dirs** (placeholder shells for pending instrumentation). Classic cargo skeleton.
- **DESIGN-ledger (PRESERVE)**:
  - `state/continuous_scan.json` (4 KB) — scan status; real reader exists.
  - `state/proposals/` — paper-proposal stream (publication pipeline SSOT).
  - `.growth/growth_state.json` + `.growth/growth.log` — growth-loop ledger.
- **HYBRID**: `cross_repo_publish/` — bin + state for cross-repo publish flow.

## B. Identity surface

Light. The paper-author identity (`Anima Project / TECS-L`, `Ghost`) is implicit in paper frontmatter (e.g. `PA-04` author block) — not externalized to an `identity.{tape,yaml,md}` surface. A `papers/identity.tape` could carry the author / DOI-namespace / license / co-author convention as typed `@I` rows, but it's redundant with paper frontmatter today.

## C. Domain.md files

Root UPPERCASE: `README.md`, `README.ai.md`, `AGENTS.md` (empty), `CLAUDE.md` symlink, `LICENSE`, `n6-hexa-neuro-bci-paper.md`. The 37-paper inventory lives under `anima/PA-NN-*.md` + `anima/INDEX.md`.

Sibling `.tape` candidates:
- `anima/INDEX.tape` — the 37-paper × 127-discovery × DOI × DD-coverage matrix as a typed event stream. **The most natural fit in papers** — `INDEX.md` is already a publication ledger; `.tape` rows would carry `@D` paper-published events + `@R` measurement-cited edges.
- `cross_repo_publish/cross_repo_publish.tape` — per-cross-repo-publish event log.

## D. Per-run/per-event history

- `anima/PA-NN-*.md` papers themselves carry per-measurement history in §3-§5 (e.g. PA-04 §3 reports `Φ=4.13` E-series, `Φ=1.3` B-series, `Φ=0` C-series, `Φ=4.87` DD81 SA, …). **These are atom-grade measurement events.**
- `.growth/growth.log` — growth-loop run log.
- `state/proposals/` — paper-proposal events.

## E. Promotion candidates

- **n6 atoms (HIGH yield)**: every paper's reported result with a Φ-number, p-value, sample-size triple is a candidate atom. PA-04 alone yields ~50+ atom candidates (DD81 SA → Φ=4.87; DD82-90 wave interference → Φ=5.21; DD94 transplant → Φ=6.12; DD98-100 mega-combo → Φ=6.85; …). PA-03 / PA-12 / PA-18 / PA-21 / PA-31 add comparable yield. **Papers is by far the biggest n6-atom promotion source in the constellation.**
- **n12 cube**: per-paper × per-DD × per-Φ-result cube cells. PA-04's "50+ hypotheses × Φ" matrix is a literal cube.
- **hxc**: none — papers are markdown, no binary wire.

**Verdict: MEDIUM (cargo) / HEAVY (n6-promotion source).** Cargo-ledger migration is light (`state/*_audit/` stub dirs + 240 KB markers). The real `.tape` value is `anima/INDEX.tape` as a publication-event ledger. Theme-level: **papers is THE n6 atom promotion source** — every verified Φ/p-value/N triple is an atom waiting to be lifted.
