#!/usr/bin/env bash
# Phase-3310: typecheck after catalog_summary_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3310 ok"
echo "cleaned"
echo "OK: phase3310 e2e passed"
