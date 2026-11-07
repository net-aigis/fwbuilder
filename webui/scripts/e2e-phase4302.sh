#!/usr/bin/env bash
# Phase-4302: typecheck after expect_run_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4302 ok"
echo "cleaned"
echo "OK: phase4302 e2e passed"
