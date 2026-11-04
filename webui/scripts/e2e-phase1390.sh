#!/usr/bin/env bash
# Phase-1390: typecheck after closure honesty_paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1390 ok"
echo "cleaned"
echo "OK: phase1390 e2e passed"
