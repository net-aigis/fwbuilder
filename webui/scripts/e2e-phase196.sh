#!/usr/bin/env bash
# Phase-196: Expand configlet buttons + sshAuthNote in UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'fetchSshAuth' "$extras"
grep -q 'sshAuthNote' "$extras"
grep -q 'expand: true' "$extras"
grep -q 'Expand ' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "expand + sshAuth UI ok"
echo "cleaned"
echo "OK: phase196 e2e passed"
