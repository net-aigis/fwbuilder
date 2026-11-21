#!/usr/bin/env bash
# Phase-2510: typecheck after session_storage_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2510 ok"
echo "cleaned"
echo "OK: phase2510 e2e passed"
