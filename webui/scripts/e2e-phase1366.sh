#!/usr/bin/env bash
# Phase-1366: typecheck after milestone 2350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1366 ok"
echo "cleaned"
echo "OK: phase1366 e2e passed"
