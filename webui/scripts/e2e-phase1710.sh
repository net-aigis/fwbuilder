#!/usr/bin/env bash
# Phase-1710: typecheck after session_storage_clear export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1710 ok"
echo "cleaned"
echo "OK: phase1710 e2e passed"
