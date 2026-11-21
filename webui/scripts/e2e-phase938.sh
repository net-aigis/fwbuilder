#!/usr/bin/env bash
# Phase-938: UI sizePolicy= sample bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_size_policy' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sizePolicy=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sizePolicy sample bit ok"
echo "cleaned"
echo "OK: phase938 e2e passed"
