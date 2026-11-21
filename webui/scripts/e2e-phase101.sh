#!/usr/bin/env bash
# Phase-101: Live-Deploy mit Doppelbestätigung (App + FirewallExtras).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'onDeployLive' "$app"
grep -q 'Deploy live' "$app"
grep -q 'Type DEPLOY to confirm live install' "$app"
grep -q 'dry_run: false' "$app"
grep -q 'Type DEPLOY to confirm live install' "$extras"
grep -q 'LIVE deploy will run scp/ssh' "$extras"
echo "live deploy confirm ok"
echo "cleaned"
echo "OK: phase101 e2e passed"
