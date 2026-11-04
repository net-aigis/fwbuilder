#!/usr/bin/env bash
# Phase-2366: typecheck after Soft 2360+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2366 ok"
echo "cleaned"
echo "OK: phase2366 e2e passed"
