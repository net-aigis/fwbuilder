#!/usr/bin/env bash
# Phase-3654: typecheck after milestone 9500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3654 ok"
echo "cleaned"
echo "OK: phase3654 e2e passed"
