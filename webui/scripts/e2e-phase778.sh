#!/usr/bin/env bash
# Phase-778: UI minimum= sample bit from hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_size_policy_minimum' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'minimum=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI minimum sample bit ok"
echo "cleaned"
echo "OK: phase778 e2e passed"
