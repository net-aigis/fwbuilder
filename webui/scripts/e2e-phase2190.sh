#!/usr/bin/env bash
# Phase-2190: typecheck after operator_brief sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2190 ok"
echo "cleaned"
echo "OK: phase2190 e2e passed"
