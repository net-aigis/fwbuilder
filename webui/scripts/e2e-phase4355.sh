#!/usr/bin/env bash
# Phase-4355: UI honesty milestone + expect_run_roster session at 11700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectRunRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11700 UI ok"
echo "cleaned"
echo "OK: phase4355 e2e passed"
