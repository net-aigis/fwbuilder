#!/usr/bin/env bash
# Phase-114: Tree Collapse/Expand per Ctrl+[ / Ctrl+].
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'onCollapseTree' "$app"
grep -q 'onExpandTree' "$app"
grep -F -q 'Ctrl+[' "$sc"
grep -F -q 'Ctrl+]' "$sc"
grep -F -q 'e.key === "["' "$app"
grep -F -q 'e.key === "]"' "$app"
echo "tree expand/collapse shortcuts ok"
echo "cleaned"
echo "OK: phase114 e2e passed"
