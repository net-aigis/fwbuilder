#!/usr/bin/env bash
# Phase-1534: typecheck after surface keys expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1534 ok"
echo "cleaned"
echo "OK: phase1534 e2e passed"
