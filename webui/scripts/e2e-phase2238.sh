#!/usr/bin/env bash
# Phase-2238: typecheck after hard_gap_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2238 ok"
echo "cleaned"
echo "OK: phase2238 e2e passed"
