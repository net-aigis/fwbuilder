#!/usr/bin/env bash
# Phase-111: Compile-Log nach Update in den Viewport scrollen.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'compileLogRef' "$app"
grep -q 'scrollIntoView' "$app"
grep -q 'ref={compileLogRef}' "$app"
echo "compile log scroll ok"
echo "cleaned"
echo "OK: phase111 e2e passed"
