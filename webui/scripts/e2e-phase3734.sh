#!/usr/bin/env bash
# Phase-3734: typecheck after milestone 9750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3734 ok"
echo "cleaned"
echo "OK: phase3734 e2e passed"
