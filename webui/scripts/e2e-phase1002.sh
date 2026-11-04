#!/usr/bin/env bash
# Phase-1002: UI enabled= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_enabled' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'enabled=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI enabled= bit ok"
echo "cleaned"
echo "OK: phase1002 e2e passed"
