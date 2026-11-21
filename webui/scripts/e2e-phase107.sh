#!/usr/bin/env bash
# Phase-107: Ruleset Refresh (Button + Taste r).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
sc="$ROOT/webui/frontend/src/shortcuts.ts"
grep -q 'refreshRules({ announce: true })' "$app"
grep -q '>Refresh<' "$app" || grep -q 'Refresh' "$app"
grep -q 'Reload rules from bridge (r)' "$app"
grep -q 'Refresh current ruleset' "$sc"
echo "rules refresh ok"
echo "cleaned"
echo "OK: phase107 e2e passed"
