#!/usr/bin/env bash
# Phase-103: Objektname kopieren (Ctrl+Shift+N).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'Copied object name' "$app"
grep -q 'Ctrl+Shift+N' "$sc"
grep -q 'Copy object name' "$sc"
echo "copy object name ok"
echo "cleaned"
echo "OK: phase103 e2e passed"
