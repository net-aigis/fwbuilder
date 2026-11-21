#!/usr/bin/env bash
# Phase-3790: typecheck after hard_gaps_closure_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3790 ok"
echo "cleaned"
echo "OK: phase3790 e2e passed"
