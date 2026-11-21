#!/usr/bin/env bash
# Phase-102: Main-Tab (object/rules) in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.mainTab' "$app"
grep -q 'sessionStorage.getItem("fwbweb.mainTab")' "$app"
grep -q 'sessionStorage.setItem("fwbweb.mainTab"' "$app"
echo "mainTab persistence ok"
echo "cleaned"
echo "OK: phase102 e2e passed"
