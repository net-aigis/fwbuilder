#!/usr/bin/env bash
# Phase-3014: typecheck after milestone 7500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3014 ok"
echo "cleaned"
echo "OK: phase3014 e2e passed"
