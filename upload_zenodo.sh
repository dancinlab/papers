#!/bin/bash
# Zenodo 업로드 스크립트 — manifest.json 기반 범용 발행
# 사용법: ZENODO_TOKEN=xxx bash upload_zenodo.sh <PAPER_ID>
# 예시:   ZENODO_TOKEN=xxx bash upload_zenodo.sh N6-NANOBOT
#
# 동작:
#   1) manifest.json 에서 <PAPER_ID> 항목을 읽어 file/title/keywords/abstract 추출
#   2) Zenodo deposit 생성 → 파일 업로드 → 메타데이터 설정 → publish
#   3) DOI 출력 (manifest.json 갱신은 사용자가 별도 수행)
#
# 하위호환: 인자 없이 호출하면 PA-20 (구버전 동작)

set -e

TOKEN="${ZENODO_TOKEN:-}"
if [ -z "$TOKEN" ]; then
  echo "에러: ZENODO_TOKEN 환경변수 없음"
  echo "사용법: ZENODO_TOKEN=xxx bash upload_zenodo.sh <PAPER_ID>"
  exit 1
fi

PAPER_ID="${1:-PA-20}"
BASE="https://zenodo.org/api"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MANIFEST="$SCRIPT_DIR/manifest.json"

echo "=== $PAPER_ID 발행 시작 ==="

META=$(/usr/bin/python3 - "$MANIFEST" "$PAPER_ID" <<'PYEOF2'
import json, sys
manifest_path, pid = sys.argv[1], sys.argv[2]
m = json.load(open(manifest_path))
for p in m.get('papers', []):
    if p.get('id') == pid:
        print(json.dumps({
            'file': p.get('file', ''),
            'title': p.get('title', ''),
            'abstract': p.get('abstract_first_line', ''),
            'keywords': p.get('keywords', []),
        }, ensure_ascii=False))
        sys.exit(0)
print("ERROR: paper id not found", file=sys.stderr)
sys.exit(1)
PYEOF2
)

if [ -z "$META" ]; then
  echo "에러: manifest.json 에서 $PAPER_ID 를 찾을 수 없음"
  exit 1
fi

FILE=$(echo "$META" | /usr/bin/python3 -c "import sys,json;print(json.load(sys.stdin)['file'])")
TITLE=$(echo "$META" | /usr/bin/python3 -c "import sys,json;print(json.load(sys.stdin)['title'])")
ABSTRACT=$(echo "$META" | /usr/bin/python3 -c "import sys,json;print(json.load(sys.stdin)['abstract'])")

if [ ! -f "$SCRIPT_DIR/$FILE" ]; then
  echo "에러: 논문 파일 없음: $FILE"
  exit 1
fi

echo "  파일: $FILE"
echo "  제목: $TITLE"

RESPONSE=$(curl -s -X POST "$BASE/deposit/depositions" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}')

DEPOSIT_ID=$(echo "$RESPONSE" | /usr/bin/python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")
BUCKET_URL=$(echo "$RESPONSE" | /usr/bin/python3 -c "import sys,json; print(json.load(sys.stdin)['links']['bucket'])")
echo "  Deposit ID: $DEPOSIT_ID"

FNAME=$(basename "$FILE")
echo "  업로드: $FNAME ..."
curl -s -X PUT "$BUCKET_URL/$FNAME" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$SCRIPT_DIR/$FILE" > /dev/null

METADATA_JSON=$(/usr/bin/python3 - "$TITLE" "$ABSTRACT" "$META" <<'PYEOF2'
import json, sys
title, abstract, meta_str = sys.argv[1], sys.argv[2], sys.argv[3]
meta = json.loads(meta_str)
keywords = meta.get('keywords', []) or ["perfect number", "n=6"]
payload = {
    "metadata": {
        "title": title,
        "upload_type": "publication",
        "publication_type": "preprint",
        "description": abstract or title,
        "creators": [{"name": "Park, Min Woo", "affiliation": "Independent Research"}],
        "keywords": keywords,
        "license": "cc-by-4.0",
        "related_identifiers": [
            {"identifier": "10.5281/zenodo.19271599", "relation": "isPartOf", "resource_type": "other"},
            {"identifier": "https://github.com/need-singularity/papers", "relation": "isSupplementedBy", "resource_type": "other"}
        ]
    }
}
print(json.dumps(payload))
PYEOF2
)

echo "  메타데이터 설정..."
curl -s -X PUT "$BASE/deposit/depositions/$DEPOSIT_ID" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d "$METADATA_JSON" > /dev/null

echo "  publish ..."
PUBLISH=$(curl -s -X POST "$BASE/deposit/depositions/$DEPOSIT_ID/actions/publish" \
  -H "Authorization: Bearer $TOKEN")
DOI=$(echo "$PUBLISH" | /usr/bin/python3 -c "import sys,json; print(json.load(sys.stdin).get('doi','ERROR'))")

echo ""
echo "  성공 DOI: $DOI"
echo "  URL: https://doi.org/$DOI"
echo "  Zenodo: https://zenodo.org/records/$DEPOSIT_ID"
echo ""
echo "=== $PAPER_ID 발행 완료 ==="
echo "manifest.json 의 doi/zenodo_doi 필드를 $DOI 로 갱신하세요."
