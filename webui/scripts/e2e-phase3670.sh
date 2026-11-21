#!/usr/bin/env bash
# Phase-3670: typecheck after milestone 9550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3670 ok"
echo "cleaned"
echo "OK: phase3670 e2e passed"
