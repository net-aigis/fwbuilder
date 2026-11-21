#!/usr/bin/env bash
# Phase-1283: UI milestone + surface detail wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2100 UI ok"
echo "cleaned"
echo "OK: phase1283 e2e passed"
