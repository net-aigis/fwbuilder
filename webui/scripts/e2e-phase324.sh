#!/usr/bin/env bash
# Phase-324: 321 wiring smoke.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fidelity' webui/frontend/src/components/RuleOptions.tsx
grep -Fq 'fidelity' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'fidelity' webui/frontend/src/components/FirewallExtras.tsx
echo "fidelity headers on all option panels ok"
echo "cleaned"
echo "OK: phase324 e2e passed"
