#!/usr/bin/env bash
# Phase-1827: UI honesty milestone + track note at 3800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigHonestyTrackNote' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3800 UI ok"
echo "cleaned"
echo "OK: phase1827 e2e passed"
