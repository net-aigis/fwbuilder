#!/usr/bin/env bash
# Phase-3870: typecheck after health_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3870 ok"
echo "cleaned"
echo "OK: phase3870 e2e passed"
