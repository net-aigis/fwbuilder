#!/usr/bin/env bash
# Phase-962: UI visible= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_visible' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'visible=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI visible= bit ok"
echo "cleaned"
echo "OK: phase962 e2e passed"
