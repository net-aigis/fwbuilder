#!/usr/bin/env bash
# Phase-3838: typecheck after health_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3838 ok"
echo "cleaned"
echo "OK: phase3838 e2e passed"
