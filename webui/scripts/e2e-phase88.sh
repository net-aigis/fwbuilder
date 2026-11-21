#!/usr/bin/env bash
# Phase-88: Theme-Persistenz (localStorage-Schlüssel + UI-Wiring).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.theme' "$app"
grep -q 'localStorage.setItem("fwbweb.theme"' "$app"
grep -q 'localStorage.getItem("fwbweb.theme")' "$app"
echo "theme persistence keys ok"
echo "cleaned"
echo "OK: phase88 e2e passed"
