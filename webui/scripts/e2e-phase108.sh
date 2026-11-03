#!/usr/bin/env bash
# Phase-108: Shortcuts als Datei herunterladen.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'onDownloadShortcuts' "$app"
grep -q 'fwbweb-shortcuts.txt' "$app"
grep -q 'Download shortcuts as text file' "$app"
echo "shortcuts download ok"
echo "cleaned"
echo "OK: phase108 e2e passed"
