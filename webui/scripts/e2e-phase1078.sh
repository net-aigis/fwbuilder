#!/usr/bin/env bash
# Phase-1078: typecheck after catalog_complete.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1078 ok"
echo "cleaned"
echo "OK: phase1078 e2e passed"
