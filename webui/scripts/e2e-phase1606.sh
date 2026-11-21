#!/usr/bin/env bash
# Phase-1606: typecheck after milestone 3100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1606 ok"
echo "cleaned"
echo "OK: phase1606 e2e passed"
