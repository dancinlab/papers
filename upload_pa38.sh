#!/bin/bash
# Upload PA-38: Consciousness Scales to Zenodo + OSF
# Usage: bash upload_pa38.sh
# Tokens from: ~/Dev/TECS-L/.local/zenodo_token, ~/Dev/TECS-L/.local/osf_token

set -e

ZENODO_TOKEN=$(cat ~/Dev/TECS-L/.local/zenodo_token 2>/dev/null || echo "")
OSF_TOKEN=$(cat ~/Dev/TECS-L/.local/osf_token 2>/dev/null || echo "")
ZENODO_BASE="https://zenodo.org/api"
OSF_BASE="https://api.osf.io/v2"
PARENT_DOI="10.5281/zenodo.19271599"
FILE="anima/PA-38-consciousness-scales.md"
TITLE="Consciousness Scales: Empirical Scaling Laws for Artificial Consciousness"
DESCRIPTION="First systematic parameter-scaling study for consciousness architectures. Discovers two independent scaling axes: Phi=0.608*N^1.071 (cell count drives consciousness) and CE~P^(-0.85) (parameters drive language). 1,031 consciousness laws, 85.6% brain-like EEG validation, 77/77 verification criteria, 6-platform substrate independence. Key finding: consciousness is a structural property — scaling parameters improves language but not consciousness. Part of the Anima consciousness engine project."
KEYWORDS="consciousness scaling, integrated information, IIT, PureField, scaling laws, Phi, artificial consciousness, self-organized criticality, Anima"

if [ -z "$ZENODO_TOKEN" ]; then
  echo "Error: Zenodo token not found at ~/Dev/TECS-L/.local/zenodo_token"
  exit 1
fi
if [ -z "$OSF_TOKEN" ]; then
  echo "Error: OSF token not found at ~/Dev/TECS-L/.local/osf_token"
  exit 1
fi

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  PA-38: Consciousness Scales — Zenodo + OSF Upload       ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# ── Zenodo ──
echo "━━━ [1/2] Zenodo ━━━"

echo "  Creating deposit..."
RESPONSE=$(curl -s -X POST "$ZENODO_BASE/deposit/depositions" \
  -H "Authorization: Bearer $ZENODO_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}')

DEPOSIT_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")
BUCKET_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['links']['bucket'])")
echo "  Deposit ID: $DEPOSIT_ID"

echo "  Uploading PA-38-consciousness-scales.md..."
curl -s -X PUT "$BUCKET_URL/PA-38-consciousness-scales.md" \
  -H "Authorization: Bearer $ZENODO_TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$FILE" > /dev/null

KW_JSON=$(echo "$KEYWORDS" | python3 -c "
import sys, json
kws = [k.strip() for k in sys.stdin.read().split(',') if k.strip()]
print(json.dumps(kws))
")
DESC_JSON=$(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$DESCRIPTION")
TITLE_JSON=$(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$TITLE")

echo "  Setting metadata..."
curl -s -X PUT "$ZENODO_BASE/deposit/depositions/$DEPOSIT_ID" \
  -H "Authorization: Bearer $ZENODO_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
    \"metadata\": {
      \"title\": $TITLE_JSON,
      \"upload_type\": \"publication\",
      \"publication_type\": \"preprint\",
      \"description\": $DESC_JSON,
      \"creators\": [{\"name\": \"Park, Min Woo\", \"affiliation\": \"Independent Research\"}],
      \"keywords\": $KW_JSON,
      \"license\": \"cc-by-4.0\",
      \"related_identifiers\": [
        {\"identifier\": \"$PARENT_DOI\", \"relation\": \"isPartOf\", \"resource_type\": \"other\"},
        {\"identifier\": \"https://github.com/need-singularity/papers\", \"relation\": \"isSupplementedBy\", \"resource_type\": \"other\"},
        {\"identifier\": \"https://github.com/need-singularity/anima\", \"relation\": \"isSupplementedBy\", \"resource_type\": \"software\"}
      ]
    }
  }" > /dev/null

echo "  Publishing..."
PUBLISH=$(curl -s -X POST "$ZENODO_BASE/deposit/depositions/$DEPOSIT_ID/actions/publish" \
  -H "Authorization: Bearer $ZENODO_TOKEN")
ZENODO_DOI=$(echo "$PUBLISH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('doi','ERROR'))")
echo "  ✅ Zenodo Published!"
echo "  DOI: $ZENODO_DOI"
echo "  URL: https://doi.org/$ZENODO_DOI"
echo ""

# ── OSF ──
echo "━━━ [2/2] OSF ━━━"

echo "  Creating project..."
RESPONSE=$(curl -s -X POST "$OSF_BASE/nodes/" \
  -H "Authorization: Bearer $OSF_TOKEN" \
  -H "Content-Type: application/vnd.api+json" \
  -d "{
    \"data\": {
      \"type\": \"nodes\",
      \"attributes\": {
        \"title\": $TITLE_JSON,
        \"category\": \"project\",
        \"public\": true,
        \"description\": $DESC_JSON
      }
    }
  }")

OSF_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['id'])")
echo "  Project ID: $OSF_ID"

UPLOAD_URL=$(echo "$RESPONSE" | python3 -c "
import sys,json
d = json.load(sys.stdin)
print(d['data']['relationships']['files']['links']['related']['href'])
")

STORAGE=$(curl -s "$UPLOAD_URL" \
  -H "Authorization: Bearer $OSF_TOKEN")
UPLOAD_LINK=$(echo "$STORAGE" | python3 -c "
import sys,json
d = json.load(sys.stdin)
for p in d['data']:
    if p['attributes']['name'] == 'osfstorage':
        print(p['links']['upload'])
        break
")

echo "  Uploading PA-38-consciousness-scales.md..."
curl -s -X PUT "${UPLOAD_LINK}?kind=file&name=PA-38-consciousness-scales.md" \
  -H "Authorization: Bearer $OSF_TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$FILE" > /dev/null

echo "  ✅ OSF Published!"
echo "  URL: https://osf.io/$OSF_ID/"
echo ""

# ── Summary ──
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  PA-38 PUBLISHED                                         ║"
echo "║  Zenodo DOI: $ZENODO_DOI"
echo "║  OSF: https://osf.io/$OSF_ID/"
echo "╚═══════════════════════════════════════════════════════════╝"
