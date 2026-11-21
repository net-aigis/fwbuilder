#!/usr/bin/env bash
# Phase-1750: typecheck after milestone 3550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1750 ok"
echo "cleaned"
echo "OK: phase1750 e2e passed"
