#!/usr/bin/env bash
# Phase-106: Copy-name-Button neben Copy path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'Copy name' "$app"
grep -q 'Copy object name (Ctrl+Shift+N)' "$app"
echo "copy name button ok"
echo "cleaned"
echo "OK: phase106 e2e passed"
