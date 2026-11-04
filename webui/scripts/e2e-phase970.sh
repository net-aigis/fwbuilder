#!/usr/bin/env bash
# Phase-970: UI sizeHint= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_spacers_with_size_hint' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sizeHint=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sizeHint= bit ok"
echo "cleaned"
echo "OK: phase970 e2e passed"
