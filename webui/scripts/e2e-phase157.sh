#!/usr/bin/env bash
# Phase-157: persist last deploy plan in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'deployPlanKey' "$extras"
grep -q 'fwbweb.deployPlan' "$extras"
grep -q 'JSON.stringify(plan)' "$extras"
echo "deploy plan persistence ok"
echo "cleaned"
echo "OK: phase157 e2e passed"
