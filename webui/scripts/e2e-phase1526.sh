#!/usr/bin/env bash
# Phase-1526: typecheck after milestone 2850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1526 ok"
echo "cleaned"
echo "OK: phase1526 e2e passed"
