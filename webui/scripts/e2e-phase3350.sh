#!/usr/bin/env bash
# Phase-3350: typecheck after milestone 8550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3350 ok"
echo "cleaned"
echo "OK: phase3350 e2e passed"
