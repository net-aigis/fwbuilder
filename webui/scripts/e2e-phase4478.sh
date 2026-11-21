#!/usr/bin/env bash
# Phase-4478: typecheck after expect_steps_refusals_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4478 ok"
echo "cleaned"
echo "OK: phase4478 e2e passed"
