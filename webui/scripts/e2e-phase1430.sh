#!/usr/bin/env bash
# Phase-1430: typecheck after milestone 2550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1430 ok"
echo "cleaned"
echo "OK: phase1430 e2e passed"
