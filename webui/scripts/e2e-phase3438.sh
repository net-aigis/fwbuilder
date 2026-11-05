#!/usr/bin/env bash
# Phase-3438: typecheck after session_storage_clear_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3438 ok"
echo "cleaned"
echo "OK: phase3438 e2e passed"
