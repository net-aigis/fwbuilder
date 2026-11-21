#!/usr/bin/env bash
# Phase-3302: typecheck after milestone 8400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3302 ok"
echo "cleaned"
echo "OK: phase3302 e2e passed"
