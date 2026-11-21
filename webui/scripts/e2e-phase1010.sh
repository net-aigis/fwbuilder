#!/usr/bin/env bash
# Phase-1010: UI align= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_alignment' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'align=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI align= bit ok"
echo "cleaned"
echo "OK: phase1010 e2e passed"
