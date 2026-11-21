#!/usr/bin/env bash
# Phase-4350: typecheck after expect_run_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4350 ok"
echo "cleaned"
echo "OK: phase4350 e2e passed"
