#!/usr/bin/env bash
# Phase-659: client expect_plan_step_notes / step_notes types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_plan_step_notes?' webui/frontend/src/api/client.ts
awk '/export function fetchExpectPlanSteps/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'step_notes'
echo "client step notes ok"
echo "cleaned"
echo "OK: phase659 e2e passed"
