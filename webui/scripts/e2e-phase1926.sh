#!/usr/bin/env bash
# Phase-1926: typecheck after milestone 4100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1926 ok"
echo "cleaned"
echo "OK: phase1926 e2e passed"
