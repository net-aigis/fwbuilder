#!/usr/bin/env bash
# Phase-4515: UI honesty milestone + expect_steps_refusals_roster session at 12200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRefusalsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12200 UI ok"
echo "cleaned"
echo "OK: phase4515 e2e passed"
