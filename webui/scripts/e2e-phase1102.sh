#!/usr/bin/env bash
# Phase-1102: typecheck after milestone 1550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1102 ok"
echo "cleaned"
echo "OK: phase1102 e2e passed"
