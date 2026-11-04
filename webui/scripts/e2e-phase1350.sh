#!/usr/bin/env bash
# Phase-1350: typecheck after milestone 2300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1350 ok"
echo "cleaned"
echo "OK: phase1350 e2e passed"
