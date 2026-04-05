#!/bin/bash
# HEXA-NEURO BCI 논문 Zenodo + OSF 동시 발행
# Usage: ZENODO_TOKEN=$(cat ~/Dev/TECS-L/.local/zenodo_token) OSF_TOKEN=$(cat ~/Dev/TECS-L/.local/osf_token) bash upload_n6_neuro.sh

set -e

ZENODO_TOKEN="${ZENODO_TOKEN:-}"
OSF_TOKEN="${OSF_TOKEN:-}"
ZENODO_BASE="https://zenodo.org/api"
OSF_BASE="https://api.osf.io/v2"
PARENT_DOI="10.5281/zenodo.19271599"
N6_REPO="https://github.com/need-singularity/n6-architecture"

if [ -z "$ZENODO_TOKEN" ]; then
  echo "Error: ZENODO_TOKEN not set"
  echo "Usage: ZENODO_TOKEN=\$(cat ~/Dev/TECS-L/.local/zenodo_token) OSF_TOKEN=\$(cat ~/Dev/TECS-L/.local/osf_token) bash upload_n6_neuro.sh"
  exit 1
fi
if [ -z "$OSF_TOKEN" ]; then
  echo "Error: OSF_TOKEN not set"
  exit 1
fi

RESULTS="upload_results_n6_neuro_$(date +%Y%m%d_%H%M%S).txt"
echo "N6-NEURO Upload Results — $(date)" > "$RESULTS"
echo "================================" >> "$RESULTS"

FILE="n6-hexa-neuro-bci-paper.md"
TITLE="HEXA-NEURO: A Non-Invasive Brain-Computer Interface Architecture Derived from Perfect Number Arithmetic (n=6) — 176/176 EXACT, 23 Categories, AI Wearable + Neurological Treatment"
DESCRIPTION="We present HEXA-NEURO, a brain-computer interface architecture where all 176 design parameters across 23 neuroscience categories are uniquely determined by the arithmetic of the perfect number n=6. The core identity σ(6)·φ(6) = n·τ(6) = 24 generates a non-invasive RT-SC nanocoil array with 1.44M channels at 10μm resolution and 1ms latency. A single BCI band replaces 10 AI wearable device categories and addresses 15 neurological conditions. Python-verified: 176/176 EXACT (100%)."
KEYWORDS="brain-computer interface, perfect number, n=6 arithmetic, non-invasive BCI, room-temperature superconductor, AI wearable, neuroprosthetics, EEG, Parkinson, Alzheimer, cortical decoding, Transformer decoder"

# ═══ Zenodo ═══
echo "PAPER: HEXA-NEURO BCI"
echo "  [Zenodo] Creating deposit..."

RESPONSE=$(curl -s -X POST "$ZENODO_BASE/deposit/depositions" \
  -H "Authorization: Bearer $ZENODO_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}')

DEPOSIT_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")
BUCKET_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['links']['bucket'])")

echo "  [Zenodo] Uploading $FILE..."
curl -s -X PUT "$BUCKET_URL/$FILE" \
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

echo "  [Zenodo] Setting metadata..."
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
        {\"identifier\": \"$N6_REPO\", \"relation\": \"isSupplementedBy\", \"resource_type\": \"software\"}
      ]
    }
  }" > /dev/null

echo "  [Zenodo] Publishing..."
PUBLISH=$(curl -s -X POST "$ZENODO_BASE/deposit/depositions/$DEPOSIT_ID/actions/publish" \
  -H "Authorization: Bearer $ZENODO_TOKEN")
DOI=$(echo "$PUBLISH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('doi','ERROR'))")
echo "  [Zenodo] DOI: $DOI  (zenodo.$DEPOSIT_ID)"
echo "$DOI zenodo.$DEPOSIT_ID" >> "$RESULTS"

# ═══ OSF ═══
echo "  [OSF] Creating project..."
OSF_RESP=$(curl -s -X POST "$OSF_BASE/nodes/" \
  -H "Authorization: Bearer $OSF_TOKEN" \
  -H "Content-Type: application/vnd.api+json" \
  -d "{
    \"data\": {
      \"type\": \"nodes\",
      \"attributes\": {
        \"title\": \"$TITLE\",
        \"category\": \"project\",
        \"description\": \"$DESCRIPTION\",
        \"public\": true
      }
    }
  }")

OSF_ID=$(echo "$OSF_RESP" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['id'])")
echo "  [OSF] Project ID: $OSF_ID"

# Get upload link
UPLOAD_LINK=$(curl -s "$OSF_BASE/nodes/$OSF_ID/files/osfstorage/" \
  -H "Authorization: Bearer $OSF_TOKEN" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d['data'][0]['links']['upload'] if d.get('data') else d['links']['upload'])
" 2>/dev/null || echo "https://files.osf.io/v1/resources/$OSF_ID/providers/osfstorage/")

echo "  [OSF] Uploading $FILE..."
curl -s -X PUT "${UPLOAD_LINK}?kind=file&name=$FILE" \
  -H "Authorization: Bearer $OSF_TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$FILE" > /dev/null 2>&1

echo "  [OSF] URL: https://osf.io/$OSF_ID/"
echo "$DOI zenodo.$DEPOSIT_ID | osf.io/$OSF_ID" >> "$RESULTS"

echo ""
echo "================================"
echo "DONE!"
echo "  Zenodo DOI: $DOI"
echo "  OSF URL: https://osf.io/$OSF_ID/"
echo "  Results: $RESULTS"
echo "================================"
