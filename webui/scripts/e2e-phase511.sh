#!/usr/bin/env bash
# Phase-511: typecheck + e2e-all lists 505–512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase505' webui/scripts/e2e-all.sh
grep -q 'e2e-phase512' webui/scripts/e2e-all.sh
echo "typecheck + e2e-all 505-512 ok"
echo "cleaned"
echo "OK: phase511 e2e passed"
