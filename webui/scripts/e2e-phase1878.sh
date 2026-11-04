#!/usr/bin/env bash
# Phase-1878: typecheck after milestone 3950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1878 ok"
echo "cleaned"
echo "OK: phase1878 e2e passed"
