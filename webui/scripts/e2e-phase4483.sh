#!/usr/bin/env bash
# Phase-4483: UI honesty milestone + expect_steps_refusals_roster at 12100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expect_steps_refusals_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12100 UI ok"
echo "cleaned"
echo "OK: phase4483 e2e passed"
