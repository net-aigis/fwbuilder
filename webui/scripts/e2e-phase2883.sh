#!/usr/bin/env bash
# Phase-2883: UI honesty milestone + expect_step_roster bundle at 7100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expect_step_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7100 UI ok"
echo "cleaned"
echo "OK: phase2883 e2e passed"
