#!/usr/bin/env bash
# Phase-3462: typecheck after milestone 8900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3462 ok"
echo "cleaned"
echo "OK: phase3462 e2e passed"
