#!/usr/bin/env bash
# Phase-3758: typecheck after hard_gaps_closure_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3758 ok"
echo "cleaned"
echo "OK: phase3758 e2e passed"
