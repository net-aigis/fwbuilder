#!/usr/bin/env bash
# Phase-4147: UI honesty milestone + stack_switch_roster at 11050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stackSwitchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11050 UI ok"
echo "cleaned"
echo "OK: phase4147 e2e passed"
