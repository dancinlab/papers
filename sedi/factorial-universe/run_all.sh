#!/usr/bin/env bash
set -euo pipefail

echo "╔══════════════════════════════════════════════════╗"
echo "║  The Factorial Universe — Full Reproduction Run  ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# Step 1: Data
echo "▸ Step 1/3: Checking data..."
bash data/download.sh
echo ""

# Step 2: Notebooks
echo "▸ Step 2/3: Running notebooks..."
for nb in notebooks/0{1,2,3,4,5,6}_*.ipynb; do
    echo "  → $(basename $nb)"
    jupyter nbconvert --to notebook --execute --inplace \
        --ExecutePreprocessor.timeout=600 "$nb" 2>&1 | tail -1
done
echo ""

# Step 3: PDF
echo "▸ Step 3/3: Building paper..."
make paper
echo ""

echo "════════════════════════════════════════════════════"
echo "  Done. Output: paper.pdf"
echo "════════════════════════════════════════════════════"
