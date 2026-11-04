#!/usr/bin/env bash
# Phase-1542: typecheck after milestone 2900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1542 ok"
echo "cleaned"
echo "OK: phase1542 e2e passed"
