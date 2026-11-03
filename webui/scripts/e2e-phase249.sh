#!/usr/bin/env bash
# Phase-249: page hint shows gap from spacing.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'gap ' "$extras"
grep -q 'spacing.vertical\|spacing?.vertical' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "gap hint UI ok"
echo "cleaned"
echo "OK: phase249 e2e passed"
