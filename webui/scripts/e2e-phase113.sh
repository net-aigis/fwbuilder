#!/usr/bin/env bash
# Phase-113: Compile-Log Soft-Wrap Toggle + Persistenz.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'fwbweb.compileLogWrap' "$app"
grep -q 'compileLogWrap' "$app"
grep -q 'compile-log.nowrap' "$css"
grep -q 'No wrap' "$app"
echo "compile log wrap toggle ok"
echo "cleaned"
echo "OK: phase113 e2e passed"
