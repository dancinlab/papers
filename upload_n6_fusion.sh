#!/bin/bash
# n6-architecture 핵융합 논문 3편 Zenodo + OSF 동시 발행
# Usage: ZENODO_TOKEN=$(cat ~/Dev/TECS-L/.local/zenodo_token) OSF_TOKEN=$(cat ~/Dev/TECS-L/.local/osf_token) bash upload_n6_fusion.sh

set -e

ZENODO_TOKEN="${ZENODO_TOKEN:-}"
OSF_TOKEN="${OSF_TOKEN:-}"
ZENODO_BASE="https://zenodo.org/api"
OSF_BASE="https://api.osf.io/v2"
PARENT_DOI="10.5281/zenodo.19271599"
N6_REPO="https://github.com/need-singularity/n6-architecture"

if [ -z "$ZENODO_TOKEN" ]; then
  echo "Error: ZENODO_TOKEN not set"
  exit 1
fi
if [ -z "$OSF_TOKEN" ]; then
  echo "Error: OSF_TOKEN not set"
  exit 1
fi

RESULTS="upload_results_n6_fusion_$(date +%Y%m%d_%H%M%S).txt"
echo "N6-Fusion Upload Results — $(date)" > "$RESULTS"
echo "================================" >> "$RESULTS"

upload_zenodo() {
  local FILE="$1"
  local TITLE="$2"
  local DESCRIPTION="$3"
  local KEYWORDS="$4"
  local BASENAME=$(basename "$FILE")

  echo "  [Zenodo] Creating deposit..."
  RESPONSE=$(curl -s -X POST "$ZENODO_BASE/deposit/depositions" \
    -H "Authorization: Bearer $ZENODO_TOKEN" \
    -H "Content-Type: application/json" \
    -d '{}')

  DEPOSIT_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")
  BUCKET_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['links']['bucket'])")

  echo "  [Zenodo] Uploading $BASENAME..."
  curl -s -X PUT "$BUCKET_URL/$BASENAME" \
    -H "Authorization: Bearer $ZENODO_TOKEN" \
    -H "Content-Type: application/octet-stream" \
    --data-binary @"$FILE" > /dev/null

  KW_JSON=$(echo "$KEYWORDS" | python3 -c "
import sys, json
kws = [k.strip() for k in sys.stdin.read().split(',') if k.strip()]
print(json.dumps(kws))
")
  DESC_JSON=$(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$DESCRIPTION")

  echo "  [Zenodo] Setting metadata..."
  curl -s -X PUT "$ZENODO_BASE/deposit/depositions/$DEPOSIT_ID" \
    -H "Authorization: Bearer $ZENODO_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
      \"metadata\": {
        \"title\": $(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$TITLE"),
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
  echo "$DOI zenodo.$DEPOSIT_ID"
}

upload_osf() {
  local FILE="$1"
  local TITLE="$2"
  local DESCRIPTION="$3"
  local BASENAME=$(basename "$FILE")

  echo "  [OSF] Creating project..."
  RESPONSE=$(curl -s -X POST "$OSF_BASE/nodes/" \
    -H "Authorization: Bearer $OSF_TOKEN" \
    -H "Content-Type: application/vnd.api+json" \
    -d "{
      \"data\": {
        \"type\": \"nodes\",
        \"attributes\": {
          \"title\": $(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$TITLE"),
          \"category\": \"project\",
          \"public\": true,
          \"description\": $(python3 -c "import json,sys; print(json.dumps(sys.argv[1]))" "$DESCRIPTION")
        }
      }
    }")

  OSF_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['id'])")
  echo "  [OSF] Project ID: $OSF_ID"

  UPLOAD_URL=$(echo "$RESPONSE" | python3 -c "
import sys,json
d = json.load(sys.stdin)
print(d['data']['relationships']['files']['links']['related']['href'])
")

  STORAGE=$(curl -s "$UPLOAD_URL" -H "Authorization: Bearer $OSF_TOKEN")
  UPLOAD_LINK=$(echo "$STORAGE" | python3 -c "
import sys,json
d = json.load(sys.stdin)
for p in d['data']:
    if p['attributes']['name'] == 'osfstorage':
        print(p['links']['upload'])
        break
")

  echo "  [OSF] Uploading $BASENAME..."
  curl -s -X PUT "${UPLOAD_LINK}?kind=file&name=${BASENAME}" \
    -H "Authorization: Bearer $OSF_TOKEN" \
    -H "Content-Type: application/octet-stream" \
    --data-binary @"$FILE" > /dev/null

  echo "  [OSF] URL: https://osf.io/$OSF_ID/"
  echo "$OSF_ID"
}

N6_PAPER_DIR="$HOME/Dev/n6-architecture/docs/paper"

# ============================================================
# Paper 1: KSTAR-N6 Tokamak Physics (paper3)
# ============================================================
echo ""
echo "=== [1/3] KSTAR-N6 Tokamak Physics ==="

ZENODO_1=$(upload_zenodo \
  "$N6_PAPER_DIR/paper3-tokamak-physics.md" \
  "Numerical Patterns of the Perfect Number 6 in Tokamak Physics: Observation, Verification, and Honest Limits" \
  "Systematic survey of numerical coincidences between arithmetic functions of perfect number 6 and tokamak physics constants. 80 hypotheses tested: 4 EXACT, 20 CLOSE, 30 WEAK, 23 FAIL. Three results resist dismissal: (i) Kruskal-Shafranov q=1 as Egyptian fraction 1/2+1/3+1/6=1; (ii) snowflake divertor X-point branching tau(6)=4; (iii) ITER port allocation {6,3,4,2}={n,n/phi,tau,phi}. KSTAR steady-state barrier analysis: 4 barriers to infinite pulse. Monte Carlo z=0.74 (not significant). Part of the n=6 architecture project." \
  "tokamak, perfect number, safety factor, divertor, snowflake, MHD stability, KSTAR, steady state, n=6")
echo "$ZENODO_1" | tail -1 >> "$RESULTS"

OSF_1=$(upload_osf \
  "$N6_PAPER_DIR/paper3-tokamak-physics.md" \
  "Numerical Patterns of the Perfect Number 6 in Tokamak Physics" \
  "80 hypotheses on n=6 arithmetic in tokamak physics. KSTAR steady-state barriers. Kruskal-Shafranov q=1 = Egyptian fraction identity.")
echo "  OSF: $OSF_1"
echo "PAPER-1 | paper3-tokamak | $ZENODO_1 | osf.io/$OSF_1" >> "$RESULTS"

# ============================================================
# Paper 2: Fusion-N6 Alien Discoveries (308)
# ============================================================
echo ""
echo "=== [2/3] Fusion-N6 Alien Discoveries ==="

ZENODO_2=$(upload_zenodo \
  "$N6_PAPER_DIR/308-fusion-n6-alien-discoveries.md" \
  "Perfect Number Arithmetic in Fusion Plasma Physics: From D-T Nucleon Conservation to Tokamak Stability" \
  "Comprehensive mapping of n=6 arithmetic functions to nuclear fusion and plasma physics. 35 hypotheses via 22-lens full-spectrum scan: 13 EXACT (37.1%), 17 CLOSE, 5 WEAK, 0 FAIL. Key findings: D-T fuel cycle masses = prime factorization of 6 (p<0.001), CNO cycle catalysts = sigma+{proper divisors of 6} (p<0.01), Earth 288K = sigma*J2 (0.05% match). HEXA-FUSION tokamak design: 100% n=6 consistency across 5 levels. 8-domain Cross-DSE with 14 shared constants. 35 falsifiable predictions for KSTAR/SPARC/ITER (2026-2035)." \
  "perfect number, tokamak, D-T fusion, safety factor, CNO cycle, stellar nucleosynthesis, magnetic reconnection, HEXA-FUSION, Cross-DSE, n=6")
echo "$ZENODO_2" | tail -1 >> "$RESULTS"

OSF_2=$(upload_osf \
  "$N6_PAPER_DIR/308-fusion-n6-alien-discoveries.md" \
  "Perfect Number Arithmetic in Fusion Plasma Physics: D-T Nucleon to Tokamak Stability" \
  "13 EXACT n=6 matches in fusion physics. D-T fuel cycle, CNO catalysts, Earth 288K discovery. HEXA-FUSION design + 35 predictions.")
echo "  OSF: $OSF_2"
echo "PAPER-2 | 308-fusion-alien | $ZENODO_2 | osf.io/$OSF_2" >> "$RESULTS"

# ============================================================
# Paper 3: Plasma-Fusion Deep Paper
# ============================================================
echo ""
echo "=== [3/3] Plasma-Fusion Deep Paper ==="

ZENODO_3=$(upload_zenodo \
  "$N6_PAPER_DIR/n6-plasma-fusion-deep-paper.md" \
  "Complete n=6 Encoding of Plasma Confinement and Nuclear Fusion: From Lawson Criterion to Stellar Nucleosynthesis" \
  "Comprehensive mapping: 90+ claims across fusion deep dive (BT-291-298), plasma confinement (BT-310-317), and cross-domain bridges (BT-242-253). 82.8% EXACT (53/64 industrial parameters, Z>15sigma). Key: D-T energy partition alpha:n = 1/sopfr:4/sopfr, complete stellar nucleosynthesis ladder (all 13 alpha-process nuclides = phi(6) multiples), D-T-Li-6 fuel cycle closure (all mass numbers in div(6)∪{4}), tokamak complete n=6 map (12/12 EXACT), SLE6 percolation-plasma transport equivalence (8/8 EXACT). 12 impossibility theorems + 35 testable predictions." \
  "perfect number, plasma confinement, nuclear fusion, stellar nucleosynthesis, tokamak, Lawson criterion, MHD stability, alpha process, SLE6, n=6")
echo "$ZENODO_3" | tail -1 >> "$RESULTS"

OSF_3=$(upload_osf \
  "$N6_PAPER_DIR/n6-plasma-fusion-deep-paper.md" \
  "Complete n=6 Encoding of Plasma Confinement and Nuclear Fusion" \
  "82.8% EXACT encoding of plasma/fusion constants via n=6. Stellar nucleosynthesis ladder, Lawson criterion, tokamak complete map. 35 predictions.")
echo "  OSF: $OSF_3"
echo "PAPER-3 | plasma-fusion-deep | $ZENODO_3 | osf.io/$OSF_3" >> "$RESULTS"

echo ""
echo "================================"
echo "All 3 papers published!"
echo "Results saved to: $RESULTS"
echo ""
cat "$RESULTS"
