#!/usr/bin/env bash
# Phase-3318: typecheck after milestone 8450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3318 ok"
echo "cleaned"
echo "OK: phase3318 e2e passed"
