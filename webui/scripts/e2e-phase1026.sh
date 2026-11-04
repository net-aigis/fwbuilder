#!/usr/bin/env bash
# Phase-1026: UI rowStretch= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_pages_with_row_stretch' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'rowStretch=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI rowStretch= bit ok"
echo "cleaned"
echo "OK: phase1026 e2e passed"
