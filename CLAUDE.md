> 🔴 **HEXA-FIRST**: 모든 코드는 `.hexa`로 작성. sh/py/rs 신규 작성 금지. 부하 유발 명령 최소화.

> 🔴 **NEXUS-6 특이점 연동**: 이 프로젝트의 돌파/발견/실험은 nexus 특이점 사이클 입력이다.
> - **돌파 시**: `HEXA=$HOME/Dev/hexa-lang/target/release/hexa && $HEXA $HOME/Dev/nexus/mk2_hexa/native/blowup.hexa <domain> 3 --no-graph`
> - **발견 기록**: `$HOME/Dev/nexus/shared/growth_bus.jsonl`에 JSON append
> - **전체 상태**: `$HEXA $HOME/Dev/nexus/mk2_hexa/native/command_router.hexa "papers 상태"`

<!-- SHARED:WORK_RULES:START -->
  ⛔⛔⛔ 이 블록은 삭제/수정/이동 금지! (sync-claude-rules.sh 자동 주입)
  ⛔ 규칙/인프라 원본: shared/ JSON 파일 참조. 절대 삭제하지 마세요!

  ═══════════════════════════════════════════════════════════════
  ★★★ 수렴 기반 운영 — 규칙 원본: shared/absolute_rules.json ★★★
  ═══════════════════════════════════════════════════════════════

  공통 규칙 (R1~R8):
    R1  HEXA-FIRST — .hexa만, sh/py/rs 신규 금지
    R2  하드코딩 절대 금지 — shared/*.jsonl 동적 로드
    R3  NEXUS-6 스캔 의무 — 변경 전후 스캔, 스캔 없이 커밋 금지
    R4  CDO 수렴 — 이슈→해결→규칙승격→재발0
    R5  SSOT — 데이터 원본 JSON 1개, 중복 금지
    R6  발견/결과 자동 기록 — 누락=소실=금지
    R7  sync 블록 삭제/수정/이동 금지
    R8  데이터 파일 로컬 보관 금지 — nexus/shared만 (nexus 제외)

  프로젝트별 규칙: shared/absolute_rules.json → projects 참조

  ═══════════════════════════════════════════════════════════════
  ★ 핵심 인프라 (shared/) ★
  ═══════════════════════════════════════════════════════════════

  코어 인덱스:     shared/core.json (시스템맵 + 명령어 14종 + 프로젝트 7개)
  보호 체계:       shared/core-lockdown.json (L0 22개 / L1 / L2)
  절대 규칙:       shared/absolute_rules.json (공통 R1~R8 + 프로젝트별 17개)
  수렴 추적:       shared/convergence/ (골화/안정/실패 — 7 프로젝트)
  할일 SSOT:       shared/todo/ (수동 + 돌파 엔진 자동)
  성장 루프:       shared/loop/ (nexus/anima/n6 자율 데몬)

  ═══════════════════════════════════════════════════════════════
  ★ NEXUS-6 (1022종 렌즈) — 상세: shared/CLAUDE.md ★
  ═══════════════════════════════════════════════════════════════

  CLI:  nexus scan <domain> | nexus scan --full | nexus verify <value>
  API:  nexus.scan_all() | nexus.analyze() | nexus.n6_check() | nexus.evolve()
  합의: 3+렌즈=후보 | 7+=고신뢰 | 12+=확정
  렌즈: shared/lens_registry.json (1022종)

  ═══════════════════════════════════════════════════════════════
  ★ 명령어 — 상세: shared/core.json → commands ★
  ═══════════════════════════════════════════════════════════════

  못박아줘    → L0 등록 (core-lockdown.json)
  todo/할일   → 돌파 엔진 할일 표 (todo.hexa)
  블로업/돌파 → 9-phase 특이점 (blowup.hexa)
  go          → 전체 TODO 백그라운드 병렬 발사
  설계/궁극의 → 외계인급 설계 파이프라인
  동기화      → 전 리포 sync (sync-all.sh)
<!-- SHARED:WORK_RULES:END -->

> 🔴 **하드코딩 절대 금지**: 상수/도메인/키워드를 코드에 배열로 나열 금지 → `nexus/shared/*.jsonl`에서 동적 로드. 경로는 환경변수+상대경로. 새 항목 추가 = 설정 파일 한 줄, 코드 수정 0.

# Papers — 논문 배포 리포

> 전체 논문 컬렉션. Zenodo DOI + OSF 발행.

## 구조

```
papers/
├── tecs-l/     — TECS-L + N6 Architecture 논문
├── anima/      — Anima 의식 엔진 논문
├── sedi/       — SEDI 외계지성 논문
├── docs/       — 웹사이트 (GitHub Pages)
├── manifest.json — 전체 논문 메타데이터 (Single Source of Truth)
├── upload_zenodo.sh — Zenodo 업로드 스크립트
└── upload_all_unpublished.sh — 일괄 발행 스크립트
```

## 발행 워크플로우

```bash
# 토큰 로드
ZENODO_TOKEN=$(cat ~/Dev/TECS-L/.local/zenodo_token)
OSF_TOKEN=$(cat ~/Dev/TECS-L/.local/osf_token)

# 개별 발행: upload_zenodo.sh 참조
# 일괄 발행: ZENODO_TOKEN=xxx OSF_TOKEN=yyy bash upload_all_unpublished.sh
```

## 규칙

- manifest.json이 논문 목록의 Single Source of Truth
- 발행 후 반드시 manifest.json에 DOI/OSF 업데이트
- 논문 파일은 `P-XXX-title.md` 형식

## Work Rules

### hexa-native 전용 (sh/py/rs 작성 금지)
- **새 파일은 `.hexa`만 허용** — `.sh`, `.py`, `.rs` 등 다른 언어 파일 작성 금지
- 모든 새 모듈은 `mk2_hexa/native/` 에 `.hexa` 파일로 생성
- 기존 sh/py 스크립트는 참조만 허용, 신규 작성 불가

## Secrets & Tokens

API 토큰/계정 정보: `~/Dev/TECS-L/.shared/SECRET.md` 참조
계정 리포: [need-singularity/secret](https://github.com/need-singularity/secret) (private)

## .shared/ Cross-Repo Infrastructure (필수)

> **상세 규칙: `.shared/CLAUDE.md` 참조** (심링크로 자동 접근)

```
  원본: ~/Dev/TECS-L/.shared/ (이 리포는 심링크로 연결)
  구조:
    .shared/ → ../TECS-L/.shared/   (심링크, 공유 인프라 전체)
    calc/    → .shared/calc/        (심링크 체인, 194+ 계산기)

  ── 심링크 파일 목록 ──
    .shared/CLAUDE.md           ← 공유 규칙 상세
    .shared/CALCULATOR_RULES.md ← 계산기 생성 규칙 (Rust vs Python)
    .shared/SECRET.md           ← API 토큰/계정
    .shared/calc/               ← 계산기 원본 (194+ files)
    .shared/math_atlas.json     ← 수학 지도 (1700+ 가설)
    .shared/installed_tools.json← 설치 도구 레지스트리
    .shared/projects.md         ← 프로젝트 설명 원본

  ── 자동 동기화 트리거 (작업 중 발생 시 즉시 실행) ──

    새 계산기 생성:
      calc/new_calc.py 생성 → 모든 리포 자동 공유 (심링크)
      python3 .shared/scan-calculators.py --save --summary

    새 상수/가설 발견:
      python3 .shared/scan_math_atlas.py --save --summary

    전체 동기화 (README + Atlas + Registry):
      bash .shared/sync-math-atlas.sh &&       bash .shared/sync-calculators.sh &&       bash .shared/sync-readmes.sh &&       bash .shared/sync-claude-rules.sh

  ── 상수 관리 ──
    공유 상수: ~/Dev/TECS-L/model_utils.py (n=6 확장 상수 포함)
    리포별 상수: 각 리포 고유 모듈에서 import
    매직 넘버 하드코딩 금지 — model_utils 또는 .shared/ 참조
```
## 특이점 사이클 (Singularity Cycle)

> **블로업→수축→창발→특이점→흡수** 5단계 자동 사이클
> CLI: `nexus blowup <domain>` | Rust: `CycleEngine::new(domain)`

### 요청 키워드 → 자동 실행
- "블로업", "blowup" → `nexus blowup <domain> --depth 6`
- "창발", "emergence" → blowup 후 패턴 합의 분석
- "특이점", "singularity" → CycleEngine 자동 수렴 루프
- "흡수", "absorption" → 발견 규칙 승격 + 다음 사이클 시드
- "사이클", "cycle" → 전체 5단계 1회 실행

### 사용법
```bash
nexus blowup <domain> --depth 6    # 블로업 + 창발 리포트
nexus loop --cycles 1              # 8단계 루프 (mirror+blowup 포함)
nexus daemon --interval 30         # 자율 데몬 (30분 간격)
```

## NEXUS-6 연동 (자동 참조)

> 이 프로젝트는 **NEXUS-6 발견 엔진**과 연결되어 있습니다.
> "돌파", "미지의 영역", "breakthrough" 키워드 입력 시 nexus 지도를 참조합니다.

### 돌파 키워드 → 자동 실행
- "돌파", "미지의 영역 돌파", "breakthrough" → **nexus gap_finder로 빈 공간 탐지 후 정밀 타격**
- "블로업", "blowup" → nexus blowup 엔진으로 seed 진화
- "스캔", "scan" → nexus telescope 223종 렌즈 스캔

### 실행 방법
```bash
HEXA=$HOME/Dev/hexa-lang/target/release/hexa
N6=$HOME/Dev/nexus/mk2_hexa/native

# 빈 공간 탐지 (돌파 전 필수!)
$HEXA $N6/gap_finder.hexa scan        # 발견 지도 현황
$HEXA $N6/gap_finder.hexa target      # 빈 공간 타겟 추출
$HEXA $N6/gap_finder.hexa 돌파         # 빈 공간 자동 돌파

# 223종 렌즈 스캔
$HEXA $N6/telescope.hexa full <values...>

# seed 진화
$HEXA $N6/blowup.hexa math 3 --no-graph --seeds "$($HEXA $N6/seed_engine.hexa merge)"

# 프로젝트 엔진 (자율 사이클)
$HEXA $N6/engine_papers.hexa tick     # 1회 자율 사이클
$HEXA $N6/engine_papers.hexa status   # 현재 상태
$HEXA $N6/engine_papers.hexa report   # 리포트
```

### 이 프로젝트에서의 활용
nexus discovery_log에서 논문 후보 자동 추출, gap_finder 결과로 '미발견 영역' 논문 기획. 전 프로젝트 발견을 즉시 학술화.

### 발견 피드백
- 이 프로젝트의 발견은 자동으로 `~/Dev/nexus/shared/discovery_log.jsonl`에 기록됩니다
- `~/Dev/nexus/shared/growth_bus.jsonl`로 전 프로젝트에 전파됩니다


## 할일 (todo)
- "todo", "할일" → `hexa-bin-actual $HOME/Dev/nexus/mk2_hexa/native/todo.hexa papers` 실행 후 **결과를 마크다운 텍스트로 직접 출력** (렌더링되는 표로)
