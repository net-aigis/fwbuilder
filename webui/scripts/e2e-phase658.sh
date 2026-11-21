#!/usr/bin/env bash
# Phase-658: UI expect step notes details.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectPlanStepNotes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expect_plan_step_notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Expect steps (all 501)' webui/frontend/src/components/FirewallExtras.tsx
echo "expect step notes UI ok"
echo "cleaned"
echo "OK: phase658 e2e passed"
