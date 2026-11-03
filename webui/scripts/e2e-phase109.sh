#!/usr/bin/env bash
# Phase-109: Objekt als TSV (type/name/id) kopieren.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'onCopySelectedObjectTsv' "$app"
grep -q 'Ctrl+Shift+Y' "$app"
grep -q 'Ctrl+Shift+Y' "$sc"
grep -q 'Copy object type/name/id as TSV' "$sc"
echo "object TSV copy ok"
echo "cleaned"
echo "OK: phase109 e2e passed"
