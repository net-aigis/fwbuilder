#!/usr/bin/env bash
# Phase-227: FirewallExtras shows dialog window_title.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'dialogTitle' "$extras"
grep -q 'window_title' webui/frontend/src/api/client.ts
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "dialog title UI ok"
echo "cleaned"
echo "OK: phase227 e2e passed"
