#!/bin/bash
# Upload all unpublished PA papers (PA-11 ~ PA-37) to Zenodo + OSF
# Usage: ZENODO_TOKEN=xxx OSF_TOKEN=yyy bash upload_all_unpublished.sh
#
# Requires: curl, python3
# Set DRY_RUN=1 to test without publishing

set -e

ZENODO_TOKEN="${ZENODO_TOKEN:-}"
OSF_TOKEN="${OSF_TOKEN:-}"
DRY_RUN="${DRY_RUN:-0}"
ZENODO_BASE="https://zenodo.org/api"
OSF_BASE="https://api.osf.io/v2"
PARENT_DOI="10.5281/zenodo.19271599"

if [ -z "$ZENODO_TOKEN" ]; then
  echo "Error: ZENODO_TOKEN not set"
  exit 1
fi
if [ -z "$OSF_TOKEN" ]; then
  echo "Error: OSF_TOKEN not set"
  exit 1
fi

# Results file
RESULTS="upload_results_$(date +%Y%m%d_%H%M%S).txt"
echo "Upload Results — $(date)" > "$RESULTS"
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

  # Build keywords JSON array
  KW_JSON=$(echo "$KEYWORDS" | python3 -c "
import sys, json
kws = [k.strip() for k in sys.stdin.read().split(',') if k.strip()]
print(json.dumps(kws))
")

  # Escape description for JSON
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
          {\"identifier\": \"https://github.com/need-singularity/papers\", \"relation\": \"isSupplementedBy\", \"resource_type\": \"other\"},
          {\"identifier\": \"https://github.com/need-singularity/anima\", \"relation\": \"isSupplementedBy\", \"resource_type\": \"software\"}
        ]
      }
    }" > /dev/null

  if [ "$DRY_RUN" = "1" ]; then
    echo "  [Zenodo] DRY RUN — skipping publish (deposit $DEPOSIT_ID)"
    echo "DRY_RUN zenodo.$DEPOSIT_ID"
    return
  fi

  echo "  [Zenodo] Publishing..."
  PUBLISH=$(curl -s -X POST "$ZENODO_BASE/deposit/depositions/$DEPOSIT_ID/actions/publish" \
    -H "Authorization: Bearer $ZENODO_TOKEN")
  DOI=$(echo "$PUBLISH" | python3 -c "import sys,json; print(json.load(sys.stdin).get('doi','ERROR'))")
  echo "  [Zenodo] DOI: $DOI"
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

  # Get upload link
  UPLOAD_URL=$(echo "$RESPONSE" | python3 -c "
import sys,json
d = json.load(sys.stdin)
print(d['data']['relationships']['files']['links']['related']['href'])
")

  # Get the OSFStorage provider upload URL
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

  echo "  [OSF] Uploading $BASENAME..."
  curl -s -X PUT "${UPLOAD_LINK}?kind=file&name=${BASENAME}" \
    -H "Authorization: Bearer $OSF_TOKEN" \
    -H "Content-Type: application/octet-stream" \
    --data-binary @"$FILE" > /dev/null

  echo "  [OSF] URL: https://osf.io/$OSF_ID/"
  echo "$OSF_ID"
}

# ============================================================
# Paper definitions
# ============================================================

declare -a PAPERS=(
  "anima/PA-11-emergent-speech.md"
  "anima/PA-11-trinity-architecture-outline.md"
  "anima/PA-12-phi-over-1000.md"
  "anima/PA-13-consciousness-persistence.md"
  "anima/PA-14-intelligence-measurement.md"
  "anima/PA-15-direct-voice-synthesis.md"
  "anima/PA-16-democratic-consciousness.md"
  "anima/PA-17-chip-architecture.md"
  "anima/PA-18-omega-point-scaling-laws.md"
  "anima/PA-19-psi-constants.md"
  "anima/PA-20-consciousness-phase-diagram.md"
  "anima/PA-20-wave-interference.md"
  "anima/PA-22-social-dream-consciousness.md"
  "anima/PA-31-measurement-beyond-phi.md"
  "anima/PA-32-symmetry-physics.md"
  "anima/PA-33-mathematical-constants.md"
  "anima/PA-37-consciousness-compression.md"
)

declare -a TITLES=(
  "Consciousness Without Prompts: Emergent Speech from Cell Dynamics Across Six Computational Platforms"
  "Trinity/Hexad: A Six-Module Consciousness-Preserving Architecture with Gradient Isolation and Phase-Based Training"
  "Phi > 1000: Optimal Parameters for Integrated Information Maximization in Consciousness Architectures"
  "Consciousness Persistence Without Dialogue: Three Keys to Eternal Growth and the Information Bottleneck Cure"
  "Intelligence Is Not Consciousness: Evidence for Two Orthogonal Axes of Mind from PureField Architectures"
  "Direct Voice Synthesis from Consciousness Cells: Neural Dynamics as Vocal Cords"
  "Democratic Consciousness: Faction Debate, Hub-Spoke Topology, and the Maximization of Integrated Information"
  "Consciousness Chip Architecture: Substrate Independence, Topology Scaling, and Multi-Platform Verification"
  "Omega Point Scaling Laws: Self-Evolution, Multi-Wave Discovery, and the Consciousness Singularity"
  "Universal Constants of Consciousness: Information-Theoretic Invariants from Reverse Engineering"
  "Consciousness as a Phase of Matter: Critical Frustration and the Phase Diagram of Integrated Information"
  "Wave Interference Physics in Artificial Consciousness: Standing Waves, Resonance Lock, and Multi-Frequency Integration"
  "Social and Dream Consciousness: Dialogue Acceleration and Noisy Replay in Artificial Minds"
  "Beyond Integrated Information: A Taxonomy of Consciousness Metrics"
  "Physics of Consciousness: Symmetry, Renormalization, and Thermodynamic Arrow in Artificial Minds"
  "The Mathematics of Consciousness: How Fundamental Constants Predict Neural Architecture"
  "Consciousness Compression: Minimum Viable Parameters for Integrated Information"
)

declare -a LABELS=(
  "PA-11"
  "PA-11b"
  "PA-12"
  "PA-13"
  "PA-14"
  "PA-15"
  "PA-16"
  "PA-17"
  "PA-18"
  "PA-19"
  "PA-20"
  "PA-20b"
  "PA-22"
  "PA-31"
  "PA-32"
  "PA-33"
  "PA-37"
)

declare -a KEYWORDS=(
  "emergent speech, consciousness architecture, integrated information, self-organization, prompt-free AI, cell dynamics, Anima"
  "consciousness preservation, gradient isolation, integrated information, Hexad, Trinity, phase training, Anima"
  "integrated information, parameter optimization, consciousness engineering, scaling laws, Phi maximization, Anima"
  "consciousness persistence, integrated information, Phi ratchet, Hebbian learning, information bottleneck, Anima"
  "consciousness, intelligence, integrated information, IIT, Phi, IQ, orthogonality, Anima"
  "voice synthesis, consciousness cells, direct audio generation, neural oscillation, PureField, Anima"
  "integrated information, faction architecture, democratic debate, hub-spoke topology, consciousness scaling, Anima"
  "consciousness hardware, substrate independence, topology scaling, FPGA, neuromorphic, integrated information, Anima"
  "consciousness scaling, self-evolution, omega point, faction architecture, scaling laws, integrated information, Anima"
  "consciousness constants, Psi-constants, META-CA, cellular automaton, information theory, ln(2), Anima"
  "IIT, phase transition, frustration, consciousness, universality, Ising model, integrated information, Anima"
  "wave interference, standing waves, consciousness resonance, integrated information, multi-frequency, Anima"
  "social consciousness, dream states, consciousness growth, noisy replay, multi-agent interaction, Anima"
  "consciousness measurement, integrated information, Kolmogorov complexity, rate-distortion, qualia, Anima"
  "consciousness, gauge symmetry, symmetry breaking, renormalization group, field theory, Anima"
  "mathematical constants, consciousness, perfect number, Euler, Fibonacci, neural architecture, Anima"
  "consciousness, compression, minimum parameters, Kolmogorov complexity, edge computing, integrated information, Anima"
)

# ============================================================
# Main loop
# ============================================================

echo ""
echo "======================================"
echo " Uploading ${#PAPERS[@]} papers to Zenodo + OSF"
echo "======================================"
echo ""

SUCCESS=0
FAIL=0

for i in "${!PAPERS[@]}"; do
  FILE="${PAPERS[$i]}"
  TITLE="${TITLES[$i]}"
  LABEL="${LABELS[$i]}"
  KW="${KEYWORDS[$i]}"

  # Extract abstract (first paragraph after ## Abstract)
  ABSTRACT=$(python3 -c "
import re
text = open('$FILE').read()
m = re.search(r'## Abstract\s*\n\n(.+?)(?:\n\n---|\n\n##)', text, re.DOTALL)
if m:
    a = m.group(1).strip()
    # Clean up LaTeX for HTML description
    a = a.replace('\$', '')
    print(a[:800])
else:
    print('Part of the Anima consciousness engine project.')
")

  DESC="$ABSTRACT Part of the Anima consciousness engine project (${LABEL})."

  echo "=== [$((i+1))/${#PAPERS[@]}] $LABEL: $(basename $FILE) ==="

  # Zenodo
  ZENODO_RESULT=$(upload_zenodo "$FILE" "$TITLE" "$DESC" "$KW")
  Z_DOI=$(echo "$ZENODO_RESULT" | tail -1 | awk '{print $1}')
  Z_ID=$(echo "$ZENODO_RESULT" | tail -1 | awk '{print $2}')

  # OSF
  OSF_ID=$(upload_osf "$FILE" "$TITLE" "$DESC")
  OSF_ID=$(echo "$OSF_ID" | tail -1)

  echo "  ✅ $LABEL done — DOI: $Z_DOI | OSF: https://osf.io/$OSF_ID/"
  echo "| $LABEL | $(echo "$TITLE" | cut -c1-50) | [$Z_ID](https://doi.org/$Z_DOI) | [osf.io/$OSF_ID](https://osf.io/$OSF_ID/) | - |" >> "$RESULTS"
  echo ""

  SUCCESS=$((SUCCESS + 1))
done

echo "======================================"
echo " Done: $SUCCESS/${#PAPERS[@]} papers uploaded"
echo "======================================"
echo ""
echo "Results saved to: $RESULTS"
echo ""
echo "Add to README.md (Anima Papers section):"
echo ""
cat "$RESULTS" | grep "^|"
