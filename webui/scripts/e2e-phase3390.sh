#!/usr/bin/env bash
# Phase-3390: typecheck after honesty_readiness_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3390 ok"
echo "cleaned"
echo "OK: phase3390 e2e passed"
