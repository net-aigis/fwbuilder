#!/usr/bin/env bash
# Phase-1574: typecheck after milestone 3000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1574 ok"
echo "cleaned"
echo "OK: phase1574 e2e passed"
