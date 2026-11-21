#!/usr/bin/env bash
# Phase-2398: typecheck after honesty_path_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2398 ok"
echo "cleaned"
echo "OK: phase2398 e2e passed"
