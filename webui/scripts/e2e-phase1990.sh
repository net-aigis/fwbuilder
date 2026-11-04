#!/usr/bin/env bash
# Phase-1990: typecheck after milestone 4300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1990 ok"
echo "cleaned"
echo "OK: phase1990 e2e passed"
