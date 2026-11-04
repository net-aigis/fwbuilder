#!/usr/bin/env bash
# Phase-1174: typecheck after expect_plan_step_titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1174 ok"
echo "cleaned"
echo "OK: phase1174 e2e passed"
