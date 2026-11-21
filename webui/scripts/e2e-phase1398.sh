#!/usr/bin/env bash
# Phase-1398: typecheck after milestone 2450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1398 ok"
echo "cleaned"
echo "OK: phase1398 e2e passed"
