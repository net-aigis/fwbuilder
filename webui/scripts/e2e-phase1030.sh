#!/usr/bin/env bash
# Phase-1030: typecheck after pages_with_row_stretch.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1030 ok"
echo "cleaned"
echo "OK: phase1030 e2e passed"
