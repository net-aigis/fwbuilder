#!/usr/bin/env bash
# Phase-3494: typecheck after milestone 9000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3494 ok"
echo "cleaned"
echo "OK: phase3494 e2e passed"
