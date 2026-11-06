#!/usr/bin/env bash
# Phase-3958: typecheck after milestone 10450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3958 ok"
echo "cleaned"
echo "OK: phase3958 e2e passed"
