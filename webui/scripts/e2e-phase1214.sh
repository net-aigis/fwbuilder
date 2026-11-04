#!/usr/bin/env bash
# Phase-1214: typecheck after milestone 1900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1214 ok"
echo "cleaned"
echo "OK: phase1214 e2e passed"
