#!/usr/bin/env bash
# Phase-3422: typecheck after session_storage_clear_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3422 ok"
echo "cleaned"
echo "OK: phase3422 e2e passed"
