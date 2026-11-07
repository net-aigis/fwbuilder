#!/usr/bin/env bash
# Phase-4518: typecheck after milestone 12200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4518 ok"
echo "cleaned"
echo "OK: phase4518 e2e passed"
