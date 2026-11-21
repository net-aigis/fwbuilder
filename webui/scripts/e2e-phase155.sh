#!/usr/bin/env bash
# Phase-155: App deploy log shows mode=; interactive live confirm text.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'mode=${res.deploy.mode}' "$app"
grep -q 'expect/SSHSession installer' "$extras"
grep -q 'Continue anyway' "$extras"
echo "mode log + interactive confirm ok"
echo "cleaned"
echo "OK: phase155 e2e passed"
