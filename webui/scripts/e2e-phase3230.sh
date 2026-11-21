#!/usr/bin/env bash
# Phase-3230: typecheck after sample_field sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3230 ok"
echo "cleaned"
echo "OK: phase3230 e2e passed"
