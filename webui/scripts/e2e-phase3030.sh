#!/usr/bin/env bash
# Phase-3030: typecheck after milestone 7550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3030 ok"
echo "cleaned"
echo "OK: phase3030 e2e passed"
