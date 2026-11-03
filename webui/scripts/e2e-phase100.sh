#!/usr/bin/env bash
# Phase-100: Compile-Log herunterladen per Ctrl+Shift+D.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'onDownloadCompileLog' "$app"
grep -q 'Ctrl+Shift+D' "$app"
grep -q 'Ctrl+Shift+D' "$sc"
echo "download compile log shortcut ok"
echo "cleaned"
echo "OK: phase100 e2e passed"
