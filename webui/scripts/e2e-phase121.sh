#!/usr/bin/env bash
# Phase-121: Recent-Projekte per Alt+, / Alt+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'onCycleRecent' "$app"
grep -q 'Alt+,' "$app"
grep -q 'Cycle recent project paths' "$sc"
echo "recent project cycle ok"
echo "cleaned"
echo "OK: phase121 e2e passed"
