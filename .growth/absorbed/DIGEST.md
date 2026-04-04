# Papers Absorbed Findings Digest

Generated: 2026-04-04
Source: ready-absorber scan of ~/Dev/ready/ backups vs ~/Dev/papers/ main

## Summary

- **Total absorbed files**: 208
- **Unique (non-worktree)**: 81
- **Worktree duplicates**: 127 (same content across agent worktrees, safely ignored)

## Category Breakdown

| Category | Count (unique) | Grade Distribution |
|----------|------:|--------------------|
| data-source (sedi sources) | 16 | 16 critical |
| document (paper drafts .md) | 22 | 16 critical, 6 high |
| paper-manuscript (.tex) | 3 | 3 critical |
| publish-script | 4 | 3 critical, 1 high |
| readme | 2 | 1 critical, 1 high |
| script (.py) | 3 | 2 critical, 1 high |
| engine-code | 1 | 1 critical |
| email-template | 1 | 1 critical |
| shell-script | 1 | 1 critical |
| config/other | 5 | mixed |
| **Total unique** | **81** | **54 critical / 27 high** |

### Source Repository Distribution

| Source Repo | Count |
|-------------|------:|
| sedi (sources/analysis in papers context) | 33 |
| papers-native | 28 |
| n6-architecture | 2 |
| TECS-L | 6 |
| anima | 2 |
| other (nexus6, email, README, awesome-nn) | 4 |

## Top 10 Items by Value (n6_score, unique only)

| Rank | n6 Score | Grade | Category | Path |
|------|------:|-------|----------|------|
| 1 | 50.0 | critical | script | anima/anima/src/autonomous_loop.py |
| 2 | 50.0 | critical | publish-script | TECS-L/zenodo/batch_upload.py |
| 3 | 50.0 | critical | data-source | sedi/sedi/sources/cern_analysis.py |
| 4 | 50.0 | critical | data-source | sedi/sedi/sources/black_hole_entropy.py |
| 5 | 45.5 | critical | data-source | sedi/sedi/sources/quantum_hall.py |
| 6 | 45.5 | critical | data-source | sedi/sedi/sources/branching_ratios.py |
| 7 | 44.4 | critical | document | papers/tecs-l/P-N6-CHIP-performance-ultimate.md |
| 8 | 44.4 | critical | script | sedi/sedi/cross_correlator.py |
| 9 | 42.9 | critical | document | papers/tecs-l/n6-hexa-super-paper.md |
| 10 | 41.7 | critical | paper-manuscript | papers/tecs-l/P-bridge-theorem.tex |

## Missing Content Analysis

### 1. Missing from papers/ main (file not found)

| File | Grade | n6 |
|------|-------|----|
| publish_paper.sh | critical | 35.7 |

This script exists in the backup but not in main. May contain useful Zenodo/arXiv upload logic.

### 2. Papers Missing from manifest.json (59 files exist but not tracked)

**Brainwire papers (3):**
- brainwire/P-001-n1-cortical-deep-access.md
- brainwire/P-002-n1-epilepsy-treatment.md
- brainwire/P-003-n1-depression-panic-treatment.md

**Anima papers PA-11 through PA-38 (25):**
- PA-11 through PA-38 (consciousness-related papers, all untracked)

**TECS-L papers (31):**
- P-002-growing-conscious-lm.md, P-002-supplementary.md, P-002-ph-confusion-universality.tex
- P-23DOMAINS, P-369-tesla, P-ARITHMETIC-OF-SIX, P-bridge-theorem(.md+.tex)
- P-CODON, P-CONFLUENCE, P-DNA-A/B/C, P-FACTORIAL, P-FTL, P-HEXA-LANG
- P-ICT, P-KISSING, P-LAW79, P-MULTI-OBJECTIVE, P-NEW (.tex variants)
- P-PARADIGM, P-PARENT-IDENTITY, P-PRIME-FACTORIAL, P-SIGMA-SIGMA
- P-SLE6, P-THREE-SIGMA, P-ZERO-FREE

### 3. Papers Without DOI (4 drafts)

| ID | Title | Status |
|----|-------|--------|
| P-GUT | GUT Hierarchy and Monster Group | Draft |
| P-PRECISION | Precision Fundamental Constants from Arithmetic of Six | Draft |
| P-INTERNET | Twin Prime Infrastructure: TCP States and DNS Root Servers | Draft |
| P-ZETA | Riemann Zeta Trident: Three Independent Paths | Draft |

### 4. Cross-repo Data Sources (absorbed but belong to sedi)

16 sedi/sources/*.py files were absorbed into papers context. These are SEDI data source modules that papers reference for verification. Already exist in sedi/ main.

## Recommended Actions

| Priority | Action | Impact |
|----------|--------|--------|
| HIGH | Add 59 missing paper files to manifest.json | Manifest completeness (79 -> 138 papers tracked) |
| HIGH | Assign DOIs to 4 draft papers (P-GUT, P-PRECISION, P-INTERNET, P-ZETA) | Publication readiness |
| MED | Recover publish_paper.sh from backup | Restore upload automation |
| MED | Add brainwire/P-001~P-003 to manifest with proper metadata | Cross-repo paper tracking |
| LOW | Remove sedi source duplicates from papers absorbed (cross-repo artifacts) | Cleaner absorbed index |
| LOW | Verify PA-11~PA-38 paper quality and add to manifest | 25 anima papers untracked |
