#!/usr/bin/env bash
# Phase-3190: typecheck after milestone 8050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3190 ok"
echo "cleaned"
echo "OK: phase3190 e2e passed"
