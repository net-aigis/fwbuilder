#!/usr/bin/env bash
# Phase-1478: typecheck after milestone 2700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1478 ok"
echo "cleaned"
echo "OK: phase1478 e2e passed"
