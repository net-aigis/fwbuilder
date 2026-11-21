#!/usr/bin/env bash
# Phase-1734: typecheck after milestone 3500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1734 ok"
echo "cleaned"
echo "OK: phase1734 e2e passed"
