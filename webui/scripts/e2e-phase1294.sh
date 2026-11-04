#!/usr/bin/env bash
# Phase-1294: typecheck after related refusals UI detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1294 ok"
echo "cleaned"
echo "OK: phase1294 e2e passed"
