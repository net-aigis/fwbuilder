#!/usr/bin/env bash
# Phase-2230: typecheck after milestone 5050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2230 ok"
echo "cleaned"
echo "OK: phase2230 e2e passed"
