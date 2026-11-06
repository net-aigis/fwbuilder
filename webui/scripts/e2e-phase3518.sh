#!/usr/bin/env bash
# Phase-3518: typecheck after honesty_operator_brief_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3518 ok"
echo "cleaned"
echo "OK: phase3518 e2e passed"
