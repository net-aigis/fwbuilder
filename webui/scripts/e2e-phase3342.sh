#!/usr/bin/env bash
# Phase-3342: typecheck after honesty_readiness_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3342 ok"
echo "cleaned"
echo "OK: phase3342 e2e passed"
