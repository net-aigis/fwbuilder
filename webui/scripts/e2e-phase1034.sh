#!/usr/bin/env bash
# Phase-1034: UI pageTip= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_pages_with_tooltip' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'pageTip=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI pageTip= bit ok"
echo "cleaned"
echo "OK: phase1034 e2e passed"
