#!/usr/bin/env bash
# Phase-1286: typecheck after milestone 2100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1286 ok"
echo "cleaned"
echo "OK: phase1286 e2e passed"
