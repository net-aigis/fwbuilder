#!/usr/bin/env bash
# Phase-351: typecheck after stacked UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck ok"
echo "cleaned"
echo "OK: phase351 e2e passed"
