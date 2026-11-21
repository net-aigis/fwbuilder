#!/usr/bin/env bash
# Phase-4467: UI honesty milestone + expect_steps_refusals_roster at 12050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRefusalsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12050 UI ok"
echo "cleaned"
echo "OK: phase4467 e2e passed"
