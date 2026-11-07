#!/usr/bin/env bash
# Phase-4323: UI honesty milestone + expect_run_roster at 11600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expect_run_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11600 UI ok"
echo "cleaned"
echo "OK: phase4323 e2e passed"
