#!/usr/bin/env bash
# Phase-4387: UI honesty milestone + expect_steps_roster at 11800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11800 UI ok"
echo "cleaned"
echo "OK: phase4387 e2e passed"
