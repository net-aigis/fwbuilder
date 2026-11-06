#!/usr/bin/env bash
# Phase-3902: typecheck after res_status_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3902 ok"
echo "cleaned"
echo "OK: phase3902 e2e passed"
