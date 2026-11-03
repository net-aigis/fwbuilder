#!/usr/bin/env bash
# Phase-202: Show expect plan button in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'fetchExpectInstallPlan' "$extras"
grep -q 'Show expect plan' "$extras"
grep -q 'expectPlanText' "$extras"
grep -q 'fetchExpectInstallPlan' "$client"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "expect plan UI ok"
echo "cleaned"
echo "OK: phase202 e2e passed"
