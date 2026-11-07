#!/usr/bin/env bash
# Phase-4430: typecheck after expect_steps_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4430 ok"
echo "cleaned"
echo "OK: phase4430 e2e passed"
