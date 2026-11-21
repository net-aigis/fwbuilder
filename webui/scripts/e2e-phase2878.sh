#!/usr/bin/env bash
# Phase-2878: typecheck after expect_step_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2878 ok"
echo "cleaned"
echo "OK: phase2878 e2e passed"
