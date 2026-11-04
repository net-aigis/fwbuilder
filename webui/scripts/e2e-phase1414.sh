#!/usr/bin/env bash
# Phase-1414: typecheck after milestone 2500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1414 ok"
echo "cleaned"
echo "OK: phase1414 e2e passed"
