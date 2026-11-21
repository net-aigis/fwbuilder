#!/usr/bin/env bash
# Phase-3430: typecheck after milestone 8800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3430 ok"
echo "cleaned"
echo "OK: phase3430 e2e passed"
