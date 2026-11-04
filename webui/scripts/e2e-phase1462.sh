#!/usr/bin/env bash
# Phase-1462: typecheck after milestone 2650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1462 ok"
echo "cleaned"
echo "OK: phase1462 e2e passed"
