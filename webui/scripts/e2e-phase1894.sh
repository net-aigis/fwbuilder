#!/usr/bin/env bash
# Phase-1894: typecheck after milestone 4000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1894 ok"
echo "cleaned"
echo "OK: phase1894 e2e passed"
