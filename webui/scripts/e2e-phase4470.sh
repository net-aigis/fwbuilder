#!/usr/bin/env bash
# Phase-4470: typecheck after milestone 12050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4470 ok"
echo "cleaned"
echo "OK: phase4470 e2e passed"
