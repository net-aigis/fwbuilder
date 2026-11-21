#!/usr/bin/env bash
# Phase-221: hard_gap_open list in FirewallExtras footer.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'hardGaps' "$extras"
grep -q 'Hard gaps still open' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "hard gaps UI ok"
echo "cleaned"
echo "OK: phase221 e2e passed"
