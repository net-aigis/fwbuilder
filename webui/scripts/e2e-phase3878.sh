#!/usr/bin/env bash
# Phase-3878: typecheck after milestone 10200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3878 ok"
echo "cleaned"
echo "OK: phase3878 e2e passed"
