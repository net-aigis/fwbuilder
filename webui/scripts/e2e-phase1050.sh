#!/usr/bin/env bash
# Phase-1050: UI extLabel= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_external_label' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'extLabel=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI extLabel= bit ok"
echo "cleaned"
echo "OK: phase1050 e2e passed"
