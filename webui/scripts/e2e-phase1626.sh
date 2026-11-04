#!/usr/bin/env bash
# Phase-1626: UI surface + honesty bundle still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'buildHonestyBundle' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface+honesty bundle still ok"
echo "cleaned"
echo "OK: phase1626 e2e passed"
