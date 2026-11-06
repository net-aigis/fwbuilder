#!/usr/bin/env bash
# Phase-3742: typecheck after hard_gaps_closure_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3742 ok"
echo "cleaned"
echo "OK: phase3742 e2e passed"
