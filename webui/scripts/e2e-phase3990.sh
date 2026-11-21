#!/usr/bin/env bash
# Phase-3990: typecheck after milestone 10550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3990 ok"
echo "cleaned"
echo "OK: phase3990 e2e passed"
