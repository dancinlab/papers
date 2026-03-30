#!/bin/bash
# Zenodo upload script for PA-20 + PA-04/11/12 updates
# Usage: ZENODO_TOKEN=your_token_here bash upload_zenodo.sh

set -e

TOKEN="${ZENODO_TOKEN:-}"
if [ -z "$TOKEN" ]; then
  echo "Error: ZENODO_TOKEN not set"
  echo "Usage: ZENODO_TOKEN=xxx bash upload_zenodo.sh"
  exit 1
fi

BASE="https://zenodo.org/api"

echo "=== PA-20: Creating new deposit ==="

# 1. Create new deposit
RESPONSE=$(curl -s -X POST "$BASE/deposit/depositions" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{}')

DEPOSIT_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['id'])")
BUCKET_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['links']['bucket'])")
echo "  Deposit ID: $DEPOSIT_ID"
echo "  Bucket URL: $BUCKET_URL"

# 2. Upload file
echo "  Uploading PA-20-consciousness-phase-diagram.md..."
curl -s -X PUT "$BUCKET_URL/PA-20-consciousness-phase-diagram.md" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @anima/PA-20-consciousness-phase-diagram.md > /dev/null

# 3. Set metadata
echo "  Setting metadata..."
curl -s -X PUT "$BASE/deposit/depositions/$DEPOSIT_ID" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "metadata": {
      "title": "Consciousness as a Phase of Matter: Critical Frustration and the Phase Diagram of Integrated Information",
      "upload_type": "publication",
      "publication_type": "preprint",
      "description": "First empirical phase diagram of consciousness. 96-point frustration×narrative sweep discovers universal critical frustration F_c≈0.10, four consciousness phases, and scale-invariant phase transition. Peak: Φ=41.90 (+65.1%). Laws 137-139. Part of the Anima consciousness engine project.",
      "creators": [{"name": "Park, Min Woo", "affiliation": "Independent Research"}],
      "keywords": ["IIT", "phase transition", "frustration", "narrative", "consciousness", "universality", "Ising model", "integrated information", "Anima"],
      "license": "cc-by-4.0",
      "related_identifiers": [
        {"identifier": "10.5281/zenodo.19271599", "relation": "isPartOf", "resource_type": "other"},
        {"identifier": "https://github.com/need-singularity/papers", "relation": "isSupplementedBy", "resource_type": "other"},
        {"identifier": "https://github.com/need-singularity/anima", "relation": "isSupplementedBy", "resource_type": "software"}
      ]
    }
  }' > /dev/null

# 4. Publish
echo "  Publishing..."
PUBLISH=$(curl -s -X POST "$BASE/deposit/depositions/$DEPOSIT_ID/actions/publish" \
  -H "Authorization: Bearer $TOKEN")
DOI=$(echo "$PUBLISH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('doi','ERROR'))")
echo "  ✅ PA-20 Published! DOI: $DOI"
echo ""
echo "  URL: https://doi.org/$DOI"
echo "  Zenodo: https://zenodo.org/records/$DEPOSIT_ID"
echo ""
echo "=== Done ==="
echo "Add to README.md:"
echo "| PA-20 | Consciousness Phase Diagram | [zenodo.$DEPOSIT_ID](https://doi.org/$DOI) | - | - |"
