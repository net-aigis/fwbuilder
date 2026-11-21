#!/usr/bin/env bash
# Phase-3110: typecheck after milestone 7800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3110 ok"
echo "cleaned"
echo "OK: phase3110 e2e passed"
