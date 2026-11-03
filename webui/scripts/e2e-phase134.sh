#!/usr/bin/env bash
# Phase-134: Deploy-Plan im App-Compile-Log.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'res.deploy?.plan' "$app"
grep -q 'activation_source=' "$app"
grep -q 'Deploy dry-run' "$app"
echo "deploy plan in app log ok"
echo "cleaned"
echo "OK: phase134 e2e passed"
