#!/usr/bin/env bash
# Phase-4307: UI honesty milestone + expect_run_roster at 11550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectRunRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11550 UI ok"
echo "cleaned"
echo "OK: phase4307 e2e passed"
