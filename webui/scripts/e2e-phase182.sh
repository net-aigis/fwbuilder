#!/usr/bin/env bash
# Phase-182: CSS grid columns use .ui columnstretch fr weights.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
helper="$ROOT/webui/frontend/src/qtGrid.ts"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'columnsFromStretch\|columnStretch' "$helper"
grep -q 'column_stretch' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "column stretch UI ok"
echo "cleaned"
echo "OK: phase182 e2e passed"
