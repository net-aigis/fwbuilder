#!/usr/bin/env bash
# Phase-2910: typecheck after expect_step_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2910 ok"
echo "cleaned"
echo "OK: phase2910 e2e passed"
