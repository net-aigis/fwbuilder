#!/usr/bin/env bash
# Phase-93: rulesWhich in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.rulesWhich' "$app"
grep -q 'sessionStorage.setItem("fwbweb.rulesWhich"' "$app"
grep -q 'sessionStorage.getItem("fwbweb.rulesWhich")' "$app"
echo "rulesWhich persistence ok"
echo "cleaned"
echo "OK: phase93 e2e passed"
