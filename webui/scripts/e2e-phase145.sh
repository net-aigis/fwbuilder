#!/usr/bin/env bash
# Phase-145: use_scp deploy body + Use SCP / Copy plan UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
deploy="$ROOT/webui/backend/fwbweb_api/routes/deploy.py"
grep -q 'Use SCP' "$extras"
grep -q 'use_scp: useScp' "$extras"
grep -q 'Copy plan' "$extras"
grep -q 'onCopyPlan' "$extras"
grep -q 'use_scp?: boolean' "$client"
grep -q 'use_scp: bool | None' "$deploy"
grep -q 'body.use_scp' "$deploy"
echo "use_scp + copy plan ok"
echo "cleaned"
echo "OK: phase145 e2e passed"
