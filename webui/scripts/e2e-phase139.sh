#!/usr/bin/env bash
# Phase-139: Deploy compress flag (desktop compressScript) + UI checkbox.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
deploy="$ROOT/webui/backend/fwbweb_api/routes/deploy.py"
grep -qE 'Compress (script|transfer)' "$extras"
grep -q 'compress,' "$extras"
grep -q 'compress?: boolean' "$client"
grep -q 'compress: bool | None' "$deploy"
grep -q 'body.compress' "$deploy"
echo "compress deploy flag ok"
echo "cleaned"
echo "OK: phase139 e2e passed"
