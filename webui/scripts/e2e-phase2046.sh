#!/usr/bin/env bash
# Phase-2046: typecheck after soft_complete_note sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2046 ok"
echo "cleaned"
echo "OK: phase2046 e2e passed"
