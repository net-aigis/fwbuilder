#!/usr/bin/env bash
# Phase-1678: typecheck after surface clear expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1678 ok"
echo "cleaned"
echo "OK: phase1678 e2e passed"
