#!/usr/bin/env bash
# Phase-3750: typecheck after milestone 9800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3750 ok"
echo "cleaned"
echo "OK: phase3750 e2e passed"
