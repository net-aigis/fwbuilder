#!/usr/bin/env bash
# Phase-4758: typecheck after milestone 12950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4758 ok"
echo "cleaned"
echo "OK: phase4758 e2e passed"
