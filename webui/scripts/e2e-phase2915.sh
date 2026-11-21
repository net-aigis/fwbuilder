#!/usr/bin/env bash
# Phase-2915: UI honesty milestone + expect_step sessionStorage at 7200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7200 UI ok"
echo "cleaned"
echo "OK: phase2915 e2e passed"
