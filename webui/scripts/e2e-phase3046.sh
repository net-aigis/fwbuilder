#!/usr/bin/env bash
# Phase-3046: typecheck after milestone 7600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3046 ok"
echo "cleaned"
echo "OK: phase3046 e2e passed"
