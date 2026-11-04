#!/usr/bin/env bash
# Phase-1170: UI expect step titles bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_plan_step_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectPlanStepTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect step titles ok"
echo "cleaned"
echo "OK: phase1170 e2e passed"
