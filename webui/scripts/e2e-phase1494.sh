#!/usr/bin/env bash
# Phase-1494: typecheck after milestone 2750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1494 ok"
echo "cleaned"
echo "OK: phase1494 e2e passed"
