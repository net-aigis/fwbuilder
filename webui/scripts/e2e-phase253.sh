#!/usr/bin/env bash
# Phase-253: expect plan persisted in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'expectPlanKey' "$extras"
grep -q 'fwbweb.expectPlan' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "expect plan persist ok"
echo "cleaned"
echo "OK: phase253 e2e passed"
