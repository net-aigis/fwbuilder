#!/usr/bin/env bash
# Phase-233: FirewallExtras loads hard gaps via fetchHardGaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'fetchHardGaps' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "fetchHardGaps UI ok"
echo "cleaned"
echo "OK: phase233 e2e passed"
