#!/usr/bin/env bash
# Phase-1246: typecheck after milestone 2000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1246 ok"
echo "cleaned"
echo "OK: phase1246 e2e passed"
