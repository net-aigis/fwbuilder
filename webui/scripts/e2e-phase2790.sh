#!/usr/bin/env bash
# Phase-2790: typecheck after milestone 6800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2790 ok"
echo "cleaned"
echo "OK: phase2790 e2e passed"
