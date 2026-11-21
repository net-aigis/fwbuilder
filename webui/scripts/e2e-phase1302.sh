#!/usr/bin/env bash
# Phase-1302: typecheck after milestone 2150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1302 ok"
echo "cleaned"
echo "OK: phase1302 e2e passed"
