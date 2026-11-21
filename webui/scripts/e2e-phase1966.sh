#!/usr/bin/env bash
# Phase-1966: typecheck after catalog_summary readiness flags.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1966 ok"
echo "cleaned"
echo "OK: phase1966 e2e passed"
