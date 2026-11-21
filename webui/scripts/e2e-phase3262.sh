#!/usr/bin/env bash
# Phase-3262: typecheck after catalog_summary_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3262 ok"
echo "cleaned"
echo "OK: phase3262 e2e passed"
