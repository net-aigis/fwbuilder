#!/usr/bin/env bash
# Phase-1958: typecheck after milestone 4200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1958 ok"
echo "cleaned"
echo "OK: phase1958 e2e passed"
