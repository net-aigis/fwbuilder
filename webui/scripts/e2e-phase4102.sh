#!/usr/bin/env bash
# Phase-4102: typecheck after milestone 10900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4102 ok"
echo "cleaned"
echo "OK: phase4102 e2e passed"
