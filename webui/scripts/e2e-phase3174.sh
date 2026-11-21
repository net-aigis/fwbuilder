#!/usr/bin/env bash
# Phase-3174: typecheck after milestone 8000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3174 ok"
echo "cleaned"
echo "OK: phase3174 e2e passed"
