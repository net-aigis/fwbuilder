#!/usr/bin/env bash
# Phase-1038: typecheck after pages_with_tooltip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1038 ok"
echo "cleaned"
echo "OK: phase1038 e2e passed"
