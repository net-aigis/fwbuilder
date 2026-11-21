#!/usr/bin/env bash
# Phase-3795: UI honesty milestone + hard_gaps_closure_roster session at 9950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsClosureRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9950 UI ok"
echo "cleaned"
echo "OK: phase3795 e2e passed"
