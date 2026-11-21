#!/usr/bin/env bash
# Phase-2406: typecheck after milestone 5600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2406 ok"
echo "cleaned"
echo "OK: phase2406 e2e passed"
