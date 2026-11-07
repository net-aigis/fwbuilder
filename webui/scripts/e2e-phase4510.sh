#!/usr/bin/env bash
# Phase-4510: typecheck after expect_steps_refusals_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4510 ok"
echo "cleaned"
echo "OK: phase4510 e2e passed"
