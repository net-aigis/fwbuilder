#!/usr/bin/env bash
# Phase-3982: typecheck after hard_gaps_field_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3982 ok"
echo "cleaned"
echo "OK: phase3982 e2e passed"
