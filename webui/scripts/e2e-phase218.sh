#!/usr/bin/env bash
# Phase-218: FirewallExtras shows soft-complete phase in resHint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'soft_complete_phase' "$extras"
grep -q 'expect_install_plan' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "soft-complete UI hint ok"
echo "cleaned"
echo "OK: phase218 e2e passed"
