---
schema: papers/ai-native/1
title: papers raw 270/271/272/273 triplet landed (2 domains, 16 files, FACADE additive)
date: 2026-05-03
agent: BG-PR (papers raw 270 triplet follow-up)
preset: friendly
mk2_scope: in_scope (peer perspective, additive only)
markers:
  landed: papers/state/markers/papers_raw270_triplet_landed.marker
ssot:
  domains:
    - papers/.roadmap.papers
    - papers/.roadmap.cross_repo_publish
  raw_anchor: hive/.raw.mk2 arch.001 (raw 270/271/272/273)
  predecessor: papers/docs/papers_mk2_redesign_landed_2026_05_03.ai.md (mk2 .roadmap.* land)
---

# papers raw 270/271/272/273 triplet landed — 2 domains, 16 files, FACADE additive

## Icon

[BOOKS] (papers archive) + [LAYERS] (4-file core/+modules/ pattern) + [FACADE]
(tool/* references, no in-place change) + [PEER] (mk2 perspective)

## Analogy

도서관 카탈로그 시스템 = `manifest.json` (433책 단일 대장).
사서 도구 19종 = `tool/*.hexa` (실제 일하는 도구).
신규 코드열람 게시판 = `core/<domain>/{source,registry,router,*main}.hexa` (cold-read agent용 인터페이스 안내판).
도구 호출 안내 카드 = `modules/<domain>/<op>.hexa` (도구당 1장, FACADE; 실제 도구는 안 건드림).
회칙 = raw 270/271/272/273 (mk2 arch.001) — core/+modules/ 4-file 패턴 + README.ai.md mandate + import 방향.

## 7-element snapshot

| element | value |
|---|---|
| repo | `/Users/ghost/core/papers/` |
| 신규 도메인 | 2 (`papers` + `cross_repo_publish`) |
| 신규 파일 | 16 (4 core × 2 domain + 3 modules × 2 domain + 2 README.ai.md) |
| 총 LOC | 2423 (1329 core + 696 modules + 398 README) |
| 정책 | additive only (tool/*, bin/, manifest.json, project.hexa 무수정) |
| 참조 tool/ 파일 | 7 (manifest_query, doi_verify, zenodo_publish, zenodo_sync, papers_cross_repo_lint, orphan_paper_scan, continuous_scan) |
| FACADE 패턴 | 6 modules — meta-only by default, opt-in shell-out via `PAPERS_FACADE_SHELL=1` |

## ASCII map (raw 270/271/272/273 토폴로지 신규 land)

```
papers repo (additive raw 270 triplet land 2026-05-03)
+-- core/                                                NEW
|   +-- papers/                                          (domain 1, raw 270 strict)
|   |   +-- source.hexa            T0  interface contract     (136 LOC)
|   |   +-- registry.hexa          T1  name -> dispatch       (178 LOC)
|   |   +-- router.hexa            T1  verb -> op routing     (167 LOC)
|   |   `-- papers_main.hexa       T1  aggregator (stem=feature, raw 270 strict) (186 LOC)
|   `-- cross_repo_publish/                              (domain 2, stem deviation C1)
|       +-- source.hexa            T0  interface contract     (133 LOC)
|       +-- registry.hexa          T1  name -> dispatch       (182 LOC)
|       +-- router.hexa            T1  verb -> op routing     (148 LOC)
|       `-- main.hexa              T1  aggregator (stem='main', raw 270 deviation, see C1) (199 LOC)
|
+-- modules/                                             NEW
|   +-- papers/                                          (domain 1 modules)
|   |   +-- README.ai.md           raw 271 mandate            (183 LOC)
|   |   +-- manifest_query.hexa    T2 FACADE -> tool/manifest_query.hexa  (120 LOC, ref 986)
|   |   +-- doi_verify.hexa        T2 FACADE -> tool/doi_verify.hexa      (113 LOC, ref 201)
|   |   `-- zenodo_publish.hexa    T2 FACADE -> tool/zenodo_publish.hexa  (114 LOC, ref 619)
|   `-- cross_repo_publish/                              (domain 2 modules)
|       +-- README.ai.md           raw 271 mandate            (215 LOC)
|       +-- publish.hexa           T2 FACADE -> tool/zenodo_publish.hexa     (116 LOC, ref 619)
|       +-- sync.hexa              T2 FACADE -> tool/zenodo_sync.hexa       (111 LOC, ref 207)
|       `-- validate.hexa          T2 FACADE -> tool/papers_cross_repo_lint.hexa (122 LOC, ref 388)
|
+-- (untouched, in-place change FORBIDDEN per BG policy):
    tool/                          19 files, 7 referenced
    bin/papers                     12-verb dispatch unchanged
    manifest.json                  183 KB, 433+ paper SSOT unchanged
    project.hexa                   unchanged
```

## Domain coverage

### Domain 1: `papers` (self-domain)

| operation | tool/ ref | LOC ref | bin verb | cond |
|-----------|-----------|--------:|----------|------|
| manifest_query | tool/manifest_query.hexa | 986 | list / get / cite / validate | papers.cond.1 |
| doi_verify | tool/doi_verify.hexa | 201 | verify | cross_repo_publish.cond.3 |
| zenodo_publish | tool/zenodo_publish.hexa | 619 | publish | cross_repo_publish.cond.2 |

Aggregator `papers_main.hexa` checks 5 categories: interface contracts (3/3),
verb routing (6 verbs), tool LOC (1806), FACADE invariant, cond coverage (3/3).

### Domain 2: `cross_repo_publish` (publish flow)

| operation | tool/ ref | LOC ref | bin verb | cond |
|-----------|-----------|--------:|----------|------|
| publish | tool/zenodo_publish.hexa | 619 | publish | cross_repo_publish.cond.2 |
| sync | tool/zenodo_sync.hexa | 207 | sync | cross_repo_publish.cond.3 |
| validate | tool/papers_cross_repo_lint.hexa | 388 | lint | cross_repo_publish.cond.1 |

Aggregator `main.hexa` checks 6 categories: interface contracts (3/3), verb
routing (3 verbs), tool LOC (1214), FACADE invariant, dual_archive coverage
(0/3 expected, blk.1 active), cond coverage (3/3).

## Sha256 manifest (16 new files)

```
core/papers/source.hexa            4a51d9a3d9d1806e01f71ee0eedc9daf55b69cb6980ccbc114dec8840a43732e
core/papers/registry.hexa          5dc781a02929601ba1d521ffd7ae426b36841eb032448e5050d6ade81383c711
core/papers/router.hexa            072d06c0f952c156bfadbeb436fcb92895ba759d6a917cc0261a0b01536e316d
core/papers/papers_main.hexa       96568ad8007e3e5ae99a7ce81e0c3534c01079738c1af3ba5ea3a7377bfa7a59

core/cross_repo_publish/source.hexa     3d40a16377b741cf9be9193f3a9068406a41892dfecf52f929b9601092760ebf
core/cross_repo_publish/registry.hexa   3036397e8abfedac277c631d0cc63fd0ceda40e3323b5001308cbe397e8d0038
core/cross_repo_publish/router.hexa     78e695d0abed467e490fbd380def98a2133b2d3f5653e3345747cd40b8330b55
core/cross_repo_publish/main.hexa       71e12b9eff743b658311b97956206b30a0e1c0c0af9da4efedff166bf8b54401

modules/papers/manifest_query.hexa     9634da1706b01abd070b91df9378e0015afbe76883bad105b017594bd66dee2b
modules/papers/doi_verify.hexa         e86e3a5ece5a1a569dd3be1c282721907738db724a0cae5be375c223afb4553a
modules/papers/zenodo_publish.hexa     4c99e1ce4827d0fe41e1dfd9a5d1503d99f5b8de39052cea079a1a2b5aa97e5f
modules/papers/README.ai.md            3a0ad0729517367cd710a92b6c1a9ea64df29ad08c7609d34123c27cadf89d12

modules/cross_repo_publish/publish.hexa     1d270441882e8db93e018058e5a249eb999ef18f264c03b2e445ee5c6703021b
modules/cross_repo_publish/sync.hexa        ec8472db051ad36e721fc2bed23a72894f3b4570923baafac857f3ab1dab1b4d
modules/cross_repo_publish/validate.hexa    b6dbb275412fe7627ef803240705ee88ac7d048c8a167add10d72ca95b31d03f
modules/cross_repo_publish/README.ai.md     0aedee36cd9e447c17990e5022413cbbb2462d3ffe0fd373e8e8b45ac2825552
```

## Sha256 referenced files (in-place untouched, additive policy verified)

```
tool/manifest_query.hexa          a9712192de508d8ba620b92f96b83269573e41f836cedc85bebe934c4bd14b2c
tool/doi_verify.hexa              398beffd9d065034b590e2344baf497bed4f70b4f7101a8216ec50ce2c590d76
tool/zenodo_publish.hexa          e8c9e7c4657a4ac8da075fae9aef22ed5df596e51cfd61631ae49b80a17dae8c
tool/zenodo_sync.hexa             4e733f8c853999da9ae91f1f964417d82c2a38199fcdcde03693cd4ab8d8da7b
tool/papers_cross_repo_lint.hexa  b49ce47143ab7cfaef9be3b71d934303f480722747c5363d7192218d1d5cc228
bin/papers                        d1129786465fbfc1184b97bb26d6edd47dc4f5908c42cfe73cac8b62539bca15
project.hexa                      a63fb8b30f03c94951756939eb1b019e82f8947a6c5b45d28fb767bc2dfdc683
```

## Caveats (raw 15)

- **C1** — `cross_repo_publish` 도메인 aggregator 파일명이 `main.hexa` (사용자
  task spec 명시) 로 land. raw 270 (mk2 arch.001 falsifier F-arch.001-1) 은
  stem-equals-feature 를 mandate 하므로 본래 `cross_repo_publish_main.hexa` 가
  되어야 함. 의도적 deviation; sibling `papers` 도메인은 raw 270 strict 로
  `papers_main.hexa` 사용. 두 도메인의 conventional inconsistency 가 발생.
  Phase 2 에서 사용자 directive 로 통일 권장 (둘 중 하나 rename, 또는 raw 270
  의 deviation-allow 조항 add).

- **C2** — 6 FACADE module 모두 meta-only 기본 동작; 실제 tool/* exec 에는
  `PAPERS_FACADE_SHELL=1` 환경변수 명시 필요. CI 안전 (selftest 시 side-
  effect 0) 하지만 cold-read agent 가 FACADE 의미를 이해 못 하면 "왜 아무것도
  안 일어나지?" 혼동 가능. README.ai.md 첫 단락에 명시.

- **C3** — `tool/doi_verify.hexa` 는 python3 heredoc 포함 (raw 9 hexa-only
  미충족, .roadmap.papers cond.3). 본 BG 의 FACADE 도 그 gap 을 inherit.
  Phase 2 cleanup cycle 별도.

- **C4** — `is_dual_archive=0` across all `cross_repo_publish` ops; OSF
  dual-archive Phase 2 stub blocker (`cross_repo_publish.blk.1`) 가 active.
  `tool/osf_publish.hexa` 미존재. Phase 2 도래 시 publish.hexa flip + osf
  module 추가 + aggregator 기댓값 0/3 -> 3/3 갱신 필요.

- **C5** — struct 정의가 16 파일 중 14 파일에 중복 declaration (PapersOpMeta /
  PapersOpResult / XrpOpMeta / XrpOpResult). hexa-lang stage0 에 cross-file
  `import` 부재 때문 — anima/core/rng/ prototype 도 동일 패턴. import lands 시
  단일화 가능 (Phase 3+).

- **C6** — `bin/papers` 12-verb dispatch 는 in-place 변경 X (BG 정책). 본 layer
  는 cold-read agent 용 parallel surface only. live entrypoint 그대로.
  router.hexa 의 verb mapping 은 informational, 실제 작동 X.

- **C7** — `papers_main.hexa` 의 5 categories 중 cond coverage 항목이
  cross_repo_publish.cond.2/3 까지 cross-domain mapping. 도메인 분리 invariant
  와 약간 충돌 — `manifest_query` 만 papers.cond.1, 나머지 2 ops 가
  cross_repo_publish.cond 로 cross-mapping. 이는 `papers` 도메인이 manifest +
  publish-pipeline 양쪽 op 를 wrapping 하기 때문. Phase 2 에서 도메인 strict-
  partition 결정 시 reorganize 권장.

- **C8** — sister-repo 의 `papers/anima/`, `papers/n6-architecture/`,
  `papers/nexus/` (이름 충돌 caveat C4 of 2026-05-03 mk2 redesign doc) 에 본
  triplet 의 영향 X — 본 land 는 `papers/core/` + `papers/modules/` 만 add,
  sister-repo-name sub-dir 미접근.

- **C9** — `selftest` 는 모두 meta-only path. `tool/*.hexa` 의 실제 동작
  (network call, manifest write, etc.) 은 검증 X. selftest PASS = FACADE
  contract 만족, NOT tool/* correctness 보장. `PAPERS_FACADE_SHELL=1`
  end-to-end smoke 별도 cycle 권장.

- **C10** — `XRP_OP_FORCE` env override (router.hexa) 는 forced op 의 정확성
  검증 X — 임의 문자열 통과. malicious input 가능성 (사용자 manual 영역만
  사용 가정).

- **C11** — README.ai.md 2 file 의 `last_updated: 2026-05-02` 는 BG-PR 직전
  날짜로 land. 실제 land 는 2026-05-03. 사소한 metadata 시차.

- **C12** — `papers/state/markers/papers_raw270_triplet_landed.marker` marker
  파일 1개만 land (silent-land 방지 protocol 충족). 3-state pattern (pending /
  installed / done) 이 아닌 단일 land marker — local convention 따름.

- **C13** — hive `.raw.mk2` arch.001 의 falsifier `F-arch.001-2` (README.ai.md
  missing in modules/<feature>/) 충족 (양 도메인 README 모두 land). 그러나
  `F-arch.001-1` (4-file pattern + ≥2 impl) 은 `cross_repo_publish` 의 stem
  deviation (C1) 으로 lint 경고 가능 — 실제 lint tool 미실행, theoretical risk.

- **C14** — `tool/orphan_paper_scan.hexa` (77 LOC), `tool/continuous_scan.hexa`
  (141 LOC), `tool/missing_doi_scan.hexa` (55 LOC) 는 source.hexa 주석에
  reference 만 add, FACADE module 미생성. `cross_repo_publish.cond.3` 의
  scan sub-cluster 는 Phase 2 module add cycle 별도 (3 scanner + 1 verify =
  4 module sub-cluster).

- **C15** — handoff doc 본 파일 (`papers/docs/papers_raw270_triplet_landed_
  2026_05_03.ai.md`) sha256 계산은 본 doc 자체 land 후 별도 cycle 측 권장
  (self-reference paradox 회피). marker 도 동일.

## Cross-link

- `papers/README.ai.md` (cold-read briefing, 2026-05-02 land — papers repo top)
- `papers/manifest.json` (433-paper SSOT, untouched)
- `papers/bin/papers` (12-verb dispatch, untouched)
- `papers/.roadmap.papers` (self-domain, 2026-05-03 land)
- `papers/.roadmap.cross_repo_publish` (publish-flow domain, 2026-05-03 land)
- `papers/docs/papers_mk2_redesign_landed_2026_05_03.ai.md` (predecessor —
  mk2 .roadmap.* 4-domain land doc)
- `hive/.raw.mk2` arch.001 (rule canonical SSOT, raw 270/271/
  272/273 4-rule cluster)
- `anima/anima/core/rng/` + `anima/anima/modules/rng/` (prototype reference;
  본 land 가 동일 패턴 적용)
- `nexus/core/qrng/` + `nexus/modules/qrng/` (sister-repo prototype reference)

## Friendly closing

도서관 사서가 새 매뉴얼 책장을 추가했어요 (도구 그대로, 안내판만 신규).
`papers/core/<domain>/` + `papers/modules/<domain>/` 구조로 cold-read 에이전트가
"papers 어떻게 쓰지?" 를 1-page README + 4-file core layout 으로 알 수 있게 됐어요.

실제 일하는 도구 (`tool/*.hexa`, `bin/papers`, `manifest.json`) 는 한 줄도 안
건드렸고, 신규 안내판 16개 (1329 + 696 + 398 LOC) 가 additive 로 land 됐어요.

다음 cycle 권장: (1) C1 stem deviation 결정 (둘 중 하나로 통일), (2) C4 OSF
Phase 2 dual-archive 진행, (3) C14 scan sub-cluster 4 module add.

Have fun reading
