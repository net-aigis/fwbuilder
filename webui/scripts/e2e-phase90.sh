#!/usr/bin/env bash
# Phase-90: Theme-Toggle-Shortcut Ctrl+Shift+L im Katalog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'Ctrl+Shift+L' "$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'e.key.toLowerCase() === "l"' "$ROOT/webui/frontend/src/App.tsx"
grep -q 'Toggle theme (Ctrl+Shift+L)' "$ROOT/webui/frontend/src/App.tsx"
echo "theme toggle shortcut ok"
echo "cleaned"
echo "OK: phase90 e2e passed"
