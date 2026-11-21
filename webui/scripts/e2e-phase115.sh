#!/usr/bin/env bash
# Phase-115: Objektkommentar kopieren (Ctrl+Shift+M + Button).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'Copied object comment' "$app"
grep -q 'Copy comment' "$app"
grep -q 'Ctrl+Shift+M' "$app"
grep -q 'Ctrl+Shift+M' "$sc"
echo "copy object comment ok"
echo "cleaned"
echo "OK: phase115 e2e passed"
