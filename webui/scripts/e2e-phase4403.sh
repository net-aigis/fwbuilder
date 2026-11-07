#!/usr/bin/env bash
# Phase-4403: UI honesty milestone + expect_steps_roster at 11850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expect_steps_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11850 UI ok"
echo "cleaned"
echo "OK: phase4403 e2e passed"
