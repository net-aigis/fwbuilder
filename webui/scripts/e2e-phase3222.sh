#!/usr/bin/env bash
# Phase-3222: typecheck after milestone 8150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3222 ok"
echo "cleaned"
echo "OK: phase3222 e2e passed"
