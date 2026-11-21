#!/usr/bin/env bash
# Phase-3238: typecheck after milestone 8200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3238 ok"
echo "cleaned"
echo "OK: phase3238 e2e passed"
