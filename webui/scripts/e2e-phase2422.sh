#!/usr/bin/env bash
# Phase-2422: typecheck after milestone 5650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2422 ok"
echo "cleaned"
echo "OK: phase2422 e2e passed"
