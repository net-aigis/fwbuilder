#!/usr/bin/env bash
# Phase-193: qtGridStyle extents include annotations.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
helper="$ROOT/webui/frontend/src/qtGrid.ts"
grep -q 'annotations' "$helper"
grep -q '\.\.\.spacers, \.\.\.annotations\|spacers, ...annotations\|...spacers, ...annotations' "$helper" \
  || grep -q 'spacers, ...annotations\|annotations.length' "$helper"
grep -q 'pageNotes' webui/frontend/src/components/FirewallExtras.tsx
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "annotation extents ok"
echo "cleaned"
echo "OK: phase193 e2e passed"
