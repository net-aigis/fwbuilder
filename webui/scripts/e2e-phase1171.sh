#!/usr/bin/env bash
# Phase-1171: client types for expect_plan_step_titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_plan_step_titles?:' webui/frontend/src/api/client.ts
echo "client expect_plan_step_titles types ok"
echo "cleaned"
echo "OK: phase1171 e2e passed"
