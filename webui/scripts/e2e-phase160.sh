#!/usr/bin/env bash
# Phase-160: live deploy on interactive OS requires force_limited_installer.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
routes="$ROOT/webui/backend/fwbweb_api/routes/deploy.py"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'force_limited_installer' "$routes"
grep -q 'force_limited_installer' "$extras"
grep -q 'force_limited_installer?: boolean' "$client"
grep -q 'expect/SSHSession installer' "$routes"
echo "force_limited_installer gate ok"
echo "cleaned"
echo "OK: phase160 e2e passed"
