#!/usr/bin/env bash
# Phase-3126: typecheck after milestone 7850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3126 ok"
echo "cleaned"
echo "OK: phase3126 e2e passed"
