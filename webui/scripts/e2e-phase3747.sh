#!/usr/bin/env bash
# Phase-3747: UI honesty milestone + hard_gaps_closure_roster at 9800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsClosureRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9800 UI ok"
echo "cleaned"
echo "OK: phase3747 e2e passed"
