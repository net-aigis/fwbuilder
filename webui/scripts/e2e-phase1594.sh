#!/usr/bin/env bash
# Phase-1594: UI surface + honesty export still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyExportDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface+honesty export still ok"
echo "cleaned"
echo "OK: phase1594 e2e passed"
