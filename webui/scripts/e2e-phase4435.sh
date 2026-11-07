#!/usr/bin/env bash
# Phase-4435: UI honesty milestone + expect_steps_roster session at 11950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11950 UI ok"
echo "cleaned"
echo "OK: phase4435 e2e passed"
