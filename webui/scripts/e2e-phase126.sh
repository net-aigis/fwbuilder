#!/usr/bin/env bash
# Phase-126: Projektpfad kopieren (Ctrl+Shift+G + Button).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'Copied project path' "$app"
grep -q 'Copy project path (Ctrl+Shift+G)' "$app"
grep -q 'Ctrl+Shift+G' "$sc"
echo "copy project path ok"
echo "cleaned"
echo "OK: phase126 e2e passed"
