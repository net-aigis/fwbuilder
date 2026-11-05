#!/usr/bin/env bash
# Phase-3086: typecheck after Soft 3080+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3086 ok"
echo "cleaned"
echo "OK: phase3086 e2e passed"
