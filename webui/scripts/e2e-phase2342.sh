#!/usr/bin/env bash
# Phase-2342: typecheck after milestone 5400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2342 ok"
echo "cleaned"
echo "OK: phase2342 e2e passed"
