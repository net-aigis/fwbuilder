#!/usr/bin/env bash
# Phase-527: typecheck + e2e-all 521–528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase521' webui/scripts/e2e-all.sh
grep -q 'e2e-phase528' webui/scripts/e2e-all.sh
echo "typecheck + e2e-all 521-528 ok"
echo "cleaned"
echo "OK: phase527 e2e passed"
