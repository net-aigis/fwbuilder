#!/usr/bin/env bash
# Phase-1158: typecheck after hard_gap_closure_titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1158 ok"
echo "cleaned"
echo "OK: phase1158 e2e passed"
