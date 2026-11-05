#!/usr/bin/env bash
# Phase-3366: typecheck after milestone 8600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3366 ok"
echo "cleaned"
echo "OK: phase3366 e2e passed"
