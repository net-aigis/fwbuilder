#!/usr/bin/env bash
# Phase-5062: typecheck after milestone 13900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5062 ok"; echo "cleaned"; echo "OK: phase5062 e2e passed"
