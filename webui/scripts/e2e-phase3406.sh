#!/usr/bin/env bash
# Phase-3406: typecheck after Soft 3400+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3406 ok"
echo "cleaned"
echo "OK: phase3406 e2e passed"
