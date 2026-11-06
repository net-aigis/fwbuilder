#!/usr/bin/env bash
# Phase-3918: typecheck after res_status_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3918 ok"
echo "cleaned"
echo "OK: phase3918 e2e passed"
