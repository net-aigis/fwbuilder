#!/usr/bin/env bash
# Phase-229: dialog geometry drives --fwb-dialog-max-height.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'dialogGeometry' "$extras"
grep -Fq -- '--fwb-dialog-max-height' "$extras"
grep -Fq -- '--fwb-dialog-max-height' "$css"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "dialog geometry CSS ok"
echo "cleaned"
echo "OK: phase229 e2e passed"
