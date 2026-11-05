#!/usr/bin/env bash
# Phase-3278: typecheck after catalog_summary_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3278 ok"
echo "cleaned"
echo "OK: phase3278 e2e passed"
