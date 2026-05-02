#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SEDI_DATA="$HOME/Dev/sedi/data/seti"

echo "=== Factorial Universe Data Setup ==="

# Voyager filterbank (504 MB) — check if already in SEDI repo
VOYAGER="$SEDI_DATA/breakthrough_listen/voyager_f1032192_t300_v2.fil"
if [ -f "$VOYAGER" ]; then
    echo "✓ Voyager filterbank found: $VOYAGER"
    ln -sf "$VOYAGER" "$SCRIPT_DIR/voyager.fil"
else
    echo "✗ Voyager filterbank not found. Download from:"
    echo "  http://blpd0.ssl.berkeley.edu/Voyager_data/"
    exit 1
fi

# Wow! signal — already in data/
if [ -f "$SCRIPT_DIR/wow_signal.json" ]; then
    echo "✓ Wow! signal data found"
else
    echo "✗ Wow! signal missing — copy from sedi repo"
    exit 1
fi

echo ""
echo "=== Data setup complete ==="
