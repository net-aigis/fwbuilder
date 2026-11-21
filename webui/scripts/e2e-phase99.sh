#!/usr/bin/env bash
# Phase-99: Compile-Log leeren (Clear-Button + Ctrl+Shift+X).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'onClearCompileLog' "$app"
grep -q 'Clear log' "$app"
grep -q 'Ctrl+Shift+X' "$app"
grep -q 'Ctrl+Shift+X' "$sc"
echo "clear compile log ok"
echo "cleaned"
echo "OK: phase99 e2e passed"
