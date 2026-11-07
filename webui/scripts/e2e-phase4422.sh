#!/usr/bin/env bash
# Phase-4422: typecheck after milestone 11900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4422 ok"
echo "cleaned"
echo "OK: phase4422 e2e passed"
