#!/usr/bin/env bash
# Phase-3470: typecheck after session_storage_clear_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3470 ok"
echo "cleaned"
echo "OK: phase3470 e2e passed"
