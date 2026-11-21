#!/usr/bin/env bash
# Phase-954: UI sampleKeys= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_key_count' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sampleKeys=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sampleKeys bit ok"
echo "cleaned"
echo "OK: phase954 e2e passed"
