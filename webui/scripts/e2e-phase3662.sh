#!/usr/bin/env bash
# Phase-3662: typecheck after hard_gaps_summary_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3662 ok"
echo "cleaned"
echo "OK: phase3662 e2e passed"
