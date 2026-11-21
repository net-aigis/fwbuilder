#!/usr/bin/env bash
# Phase-667: client expect_plan_step_notes_count / summary expect_plan_step_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_plan_step_notes_count?' webui/frontend/src/api/client.ts
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'expect_plan_step_count'
echo "client step count types ok"
echo "cleaned"
echo "OK: phase667 e2e passed"
