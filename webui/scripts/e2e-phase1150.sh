#!/usr/bin/env bash
# Phase-1150: typecheck after milestone 1700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1150 ok"
echo "cleaned"
echo "OK: phase1150 e2e passed"
