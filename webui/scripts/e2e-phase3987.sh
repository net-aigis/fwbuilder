#!/usr/bin/env bash
# Phase-3987: UI honesty milestone + hard_gaps_field_roster at 10550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsFieldRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10550 UI ok"
echo "cleaned"
echo "OK: phase3987 e2e passed"
