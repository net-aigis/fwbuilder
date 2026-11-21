#!/usr/bin/env bash
# Phase-92: Tab-Shortcuts Ctrl+1 / Ctrl+2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'e.key === "1"' "$app"
grep -q 'e.key === "2"' "$app"
grep -q 'setTab("object")' "$app"
grep -q 'setTab("rules")' "$app"
grep -q 'Ctrl+1' "$sc"
grep -q 'Ctrl+2' "$sc"
echo "tab shortcuts ok"
echo "cleaned"
echo "OK: phase92 e2e passed"
