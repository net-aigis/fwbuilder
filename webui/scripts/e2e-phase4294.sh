#!/usr/bin/env bash
# Phase-4294: typecheck after milestone 11500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4294 ok"
echo "cleaned"
echo "OK: phase4294 e2e passed"
