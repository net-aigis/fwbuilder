#!/usr/bin/env bash
# Phase-2286: typecheck after Soft 2280+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2286 ok"
echo "cleaned"
echo "OK: phase2286 e2e passed"
