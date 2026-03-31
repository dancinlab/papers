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
<!-- SHARED:WORK_RULES:END -->

## Secrets & Tokens

API 토큰/계정 정보: `~/Dev/TECS-L/.shared/SECRET.md` 참조
계정 리포: [need-singularity/secret](https://github.com/need-singularity/secret) (private)
