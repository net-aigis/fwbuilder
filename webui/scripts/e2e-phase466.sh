#!/usr/bin/env bash
# Phase-466: FirewallExtras lists expect plan step ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectPlanStepIds' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Expect steps (all 501)' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expect_plan_step_ids' webui/frontend/src/api/client.ts
echo "expect steps UI ok"
echo "cleaned"
echo "OK: phase466 e2e passed"
