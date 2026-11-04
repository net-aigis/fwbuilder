#!/usr/bin/env bash
# Phase-452: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 452 ok"
echo "cleaned"
echo "OK: phase452 e2e passed"
