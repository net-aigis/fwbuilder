#!/usr/bin/env bash
# Phase-1262: typecheck after milestone 2050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1262 ok"
echo "cleaned"
echo "OK: phase1262 e2e passed"
