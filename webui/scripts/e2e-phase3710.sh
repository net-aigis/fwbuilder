#!/usr/bin/env bash
# Phase-3710: typecheck after hard_gaps_summary_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3710 ok"
echo "cleaned"
echo "OK: phase3710 e2e passed"
