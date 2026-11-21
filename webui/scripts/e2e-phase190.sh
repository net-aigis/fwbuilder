#!/usr/bin/env bash
# Phase-190: annotation cells rendered in FirewallExtras qt-grid.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'qt-annotation' "$extras"
grep -q 'annotations' "$extras"
grep -q 'qt-annotation' "$css"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "annotation UI ok"
echo "cleaned"
echo "OK: phase190 e2e passed"
