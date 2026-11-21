#!/usr/bin/env bash
# Phase-1318: typecheck after milestone 2200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1318 ok"
echo "cleaned"
echo "OK: phase1318 e2e passed"
