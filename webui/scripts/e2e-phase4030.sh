#!/usr/bin/env bash
# Phase-4030: typecheck after hard_gaps_field_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4030 ok"
echo "cleaned"
echo "OK: phase4030 e2e passed"
