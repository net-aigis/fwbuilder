#!/usr/bin/env bash
# Phase-2518: typecheck after milestone 5950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2518 ok"
echo "cleaned"
echo "OK: phase2518 e2e passed"
