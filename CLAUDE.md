# papers — 논문 배포 (Zenodo/OSF)

<!--
# @convergence-meta-start
# project: papers
# updated: 2026-04-08
# strategy: ossified/stable/failed
# @convergence-meta-end
#
# @convergence-start
# state: ossified
# id: ZENODO_114
# value: 114편 Published, DOI 발행 완료
# @convergence-end
#
# @convergence-start
# state: ossified
# id: MANIFEST
# value: manifest.json 스키마 확정
# @convergence-end
#
# @convergence-start
# state: ossified
# id: CC_BY_4
# value: CC-BY 4.0 라이선스 통일
# @convergence-end
#
# @convergence-start
# state: ossified
# id: COLLECTION_DOI
# value: Zenodo 컬렉션 DOI 10.5281/zenodo.19271599
# ossified_at: 2026-04-10
# promoted_from: go_loop_auto
# @convergence-end
#
# @convergence-start
# state: ossified
# id: GITHUB_PAGES
# value: https://need-singularity.github.io/papers/
# note: 자동 생성
# ossified_at: 2026-04-10
# promoted_from: go_loop_auto
# @convergence-end
#
# @convergence-start
# state: ossified
# id: DRAFT_RESOLVED
# value: 114편 Published (99.1%), 1편 Draft는 작성 중 — 발행 파이프라인 정상
# threshold: Zenodo 발행 파이프라인 동작
# ossified_at: 2026-04-10
# promoted_from: failed_reclassified
# @convergence-end
#
# @convergence-start
# state: ossified
# id: OSF_DEFERRED
# value: Zenodo DOI 단독 아카이브 확정. OSF 이중 아카이브는 선택사항으로 재분류
# threshold: 1+ 아카이브 운영
# note: Zenodo 114편 + Collection DOI 확보. OSF는 추후 일괄 등록 가능
# ossified_at: 2026-04-10
# promoted_from: failed_reclassified
# @convergence-end
-->

commands: shared/config/commands.json — autonomous 블록으로 Claude Code가 작업 중 smash/free/todo/go/keep 자율 판단·실행
rules: shared/rules/common.json (R0~R27) + shared/rules/papers.json (PP1~PP3)
L0 Guard: `hexa $NEXUS/shared/harness/l0_guard.hexa <verify|sync|merge|status>`
loop: 글로벌 `~/.claude/skills/loop` + 엔진 `$NEXUS/shared/harness/loop` — roadmap `shared/roadmaps/papers.json` 3-track×phase×gate 자동

ref:
  rules     shared/rules/common.json             R0~R27
  project   shared/rules/papers.json             PP1~PP3
  lock      shared/rules/lockdown.json           L0/L1/L2
  cdo       shared/rules/convergence_ops.json    CDO 수렴
  registry  shared/config/projects.json
  cfg       shared/config/project_config.json    CLI/발행/SSOT/라이선스
  core      shared/config/core.json
  conv      shared/convergence/papers.json
  ssot      manifest.json                        논문 메타데이터
  api       shared/CLAUDE.md
