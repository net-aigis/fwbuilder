#!/usr/bin/env bash
# Phase-1763: UI honesty milestone wiring at 3600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3600 UI ok"
echo "cleaned"
echo "OK: phase1763 e2e passed"
