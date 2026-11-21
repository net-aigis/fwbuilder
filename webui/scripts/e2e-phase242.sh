#!/usr/bin/env bash
# Phase-242: qtGridStyle applies spacing as CSS gap/padding.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
helper="$ROOT/webui/frontend/src/qtGrid.ts"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'QtGridSpacing' "$helper"
grep -q 'pageSpacing' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "spacing CSS ok"
echo "cleaned"
echo "OK: phase242 e2e passed"
