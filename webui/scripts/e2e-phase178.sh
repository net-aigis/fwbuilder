#!/usr/bin/env bash
# Phase-178: Qt spacer cells rendered in options grid.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
helper="$ROOT/webui/frontend/src/qtGrid.ts"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'qtSpacerStyle' "$extras"
grep -q 'qt-spacer' "$extras"
grep -q 'export function qtSpacerStyle' "$helper"
grep -q 'qt-spacer' "$css"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "spacer UI ok"
echo "cleaned"
echo "OK: phase178 e2e passed"
