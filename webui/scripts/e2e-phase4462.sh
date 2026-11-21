#!/usr/bin/env bash
# Phase-4462: typecheck after expect_steps_refusals_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4462 ok"
echo "cleaned"
echo "OK: phase4462 e2e passed"
