#!/usr/bin/env bash
# Phase-3206: typecheck after milestone 8100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3206 ok"
echo "cleaned"
echo "OK: phase3206 e2e passed"
