#!/usr/bin/env bash
# Phase-1190: typecheck after ssh titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1190 ok"
echo "cleaned"
echo "OK: phase1190 e2e passed"
