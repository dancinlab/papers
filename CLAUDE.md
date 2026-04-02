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

<!-- SHARED:WORK_RULES:START -->
  자동 생성 규칙:
    - TODO 작업 중 검증/계산이 필요하면 계산기 자동 생성 (묻지 말고 바로)
    - 성능 필요시 Rust 우선 (tecsrs/), 단순 검증은 Python (calc/)
    - 판단 기준은 ~/Dev/TECS-L/.shared/CALCULATOR_RULES.md 참조
    - 상수/가설 발견 시 Math Atlas 자동 갱신 (python3 ~/Dev/TECS-L/.shared/scan_math_atlas.py --save --summary)
  망원경 렌즈 활용 규칙 (탐색/분석 시 별도 요청 없이 자동 적용):
    - 데이터 분석/패턴 탐색/이상점 발견/신소재·신약 탐색 시 렌즈 자동 사용
    - 9종 렌즈: .shared/ 내 *_lens.py (consciousness, gravity, topology, thermo, wave, evolution, info, quantum, em)
    - 기본 3종 스캔: 의식(구조) + 중력(끌개) + 위상(연결) → 새 데이터 분석 시 기본
    - 도메인별 조합: 신소재(진화+열역학+중력), 시계열(파동+열역학+의식), 상수(정보+양자+의식)
    - 사용: from consciousness_lens import ConsciousnessLens; ConsciousnessLens().scan(data)
    - 상세: .shared/CLAUDE.md → "망원경 툴셋 자동 활용 규칙" 참조
    - "렌즈 추가 필요?" 질문 시 → 현재 9종 커버 안 되는 도메인 분석 + 새 아이디어 즉시 제안
<!-- SHARED:WORK_RULES:END -->

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