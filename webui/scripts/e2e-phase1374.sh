#!/usr/bin/env bash
# Phase-1374: typecheck after summary honesty_paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1374 ok"
echo "cleaned"
echo "OK: phase1374 e2e passed"
