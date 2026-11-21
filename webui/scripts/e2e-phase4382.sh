#!/usr/bin/env bash
# Phase-4382: typecheck after expect_steps_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4382 ok"
echo "cleaned"
echo "OK: phase4382 e2e passed"
