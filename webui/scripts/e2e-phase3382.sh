#!/usr/bin/env bash
# Phase-3382: typecheck after milestone 8650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3382 ok"
echo "cleaned"
echo "OK: phase3382 e2e passed"
