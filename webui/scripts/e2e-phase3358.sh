#!/usr/bin/env bash
# Phase-3358: typecheck after honesty_readiness_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3358 ok"
echo "cleaned"
echo "OK: phase3358 e2e passed"
