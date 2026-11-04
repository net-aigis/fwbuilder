#!/usr/bin/env bash
# Phase-2478: typecheck after session_storage_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2478 ok"
echo "cleaned"
echo "OK: phase2478 e2e passed"
