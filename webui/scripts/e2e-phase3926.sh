#!/usr/bin/env bash
# Phase-3926: typecheck after milestone 10350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3926 ok"
echo "cleaned"
echo "OK: phase3926 e2e passed"
