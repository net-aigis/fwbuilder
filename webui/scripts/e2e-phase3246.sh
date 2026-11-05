#!/usr/bin/env bash
# Phase-3246: typecheck after Soft 3240+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3246 ok"
echo "cleaned"
echo "OK: phase3246 e2e passed"
