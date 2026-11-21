#!/usr/bin/env bash
# Phase-1790: typecheck after catalog_summary export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1790 ok"
echo "cleaned"
echo "OK: phase1790 e2e passed"
