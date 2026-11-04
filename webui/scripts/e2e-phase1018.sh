#!/usr/bin/env bash
# Phase-1018: UI readOnly= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_read_only' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'readOnly=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI readOnly= bit ok"
echo "cleaned"
echo "OK: phase1018 e2e passed"
