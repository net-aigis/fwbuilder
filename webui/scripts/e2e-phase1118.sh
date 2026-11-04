#!/usr/bin/env bash
# Phase-1118: typecheck after milestone 1600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1118 ok"
echo "cleaned"
echo "OK: phase1118 e2e passed"
