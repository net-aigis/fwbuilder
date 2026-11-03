#!/usr/bin/env bash
# Phase-148: External install script fields in FirewallExtras UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
deploy="$ROOT/webui/backend/fwbweb_api/deploy.py"
routes="$ROOT/webui/backend/fwbweb_api/routes/deploy.py"
grep -q 'External install script' "$extras"
grep -q 'install_script' "$extras"
grep -q 'plan_external_install' "$deploy"
grep -q 'plan_external_install' "$routes"
grep -q 'use_external' "$routes"
echo "external install ui+route ok"
echo "cleaned"
echo "OK: phase148 e2e passed"
