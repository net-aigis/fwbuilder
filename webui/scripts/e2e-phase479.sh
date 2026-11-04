#!/usr/bin/env bash
# Phase-479: typecheck + e2e-all lists 473–480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase473' webui/scripts/e2e-all.sh
grep -q 'e2e-phase480' webui/scripts/e2e-all.sh
echo "typecheck + e2e-all 473-480 ok"
echo "cleaned"
echo "OK: phase479 e2e passed"
