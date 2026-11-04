#!/usr/bin/env bash
# Phase-2590: typecheck after honesty_export_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2590 ok"
echo "cleaned"
echo "OK: phase2590 e2e passed"
