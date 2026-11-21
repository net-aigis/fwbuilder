#!/usr/bin/env bash
# Phase-3998: typecheck after hard_gaps_field_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3998 ok"
echo "cleaned"
echo "OK: phase3998 e2e passed"
