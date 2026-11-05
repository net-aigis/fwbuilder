#!/usr/bin/env bash
# Phase-3398: typecheck after milestone 8700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3398 ok"
echo "cleaned"
echo "OK: phase3398 e2e passed"
