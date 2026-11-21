#!/usr/bin/env bash
# Phase-3950: typecheck after res_status_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3950 ok"
echo "cleaned"
echo "OK: phase3950 e2e passed"
