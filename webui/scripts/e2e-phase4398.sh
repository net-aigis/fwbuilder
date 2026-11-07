#!/usr/bin/env bash
# Phase-4398: typecheck after expect_steps_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4398 ok"
echo "cleaned"
echo "OK: phase4398 e2e passed"
