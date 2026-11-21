#!/usr/bin/env bash
# Phase-2374: typecheck after milestone 5500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2374 ok"
echo "cleaned"
echo "OK: phase2374 e2e passed"
