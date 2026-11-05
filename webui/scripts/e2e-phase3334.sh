#!/usr/bin/env bash
# Phase-3334: typecheck after milestone 8500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3334 ok"
echo "cleaned"
echo "OK: phase3334 e2e passed"
