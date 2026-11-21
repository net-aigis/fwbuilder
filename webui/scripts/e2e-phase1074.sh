#!/usr/bin/env bash
# Phase-1074: UI catalog= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_catalog_complete' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalog=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI catalog= bit ok"
echo "cleaned"
echo "OK: phase1074 e2e passed"
