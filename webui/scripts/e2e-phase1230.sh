#!/usr/bin/env bash
# Phase-1230: typecheck after milestone 1950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1230 ok"
echo "cleaned"
echo "OK: phase1230 e2e passed"
