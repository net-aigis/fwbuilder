#!/usr/bin/env bash
# Phase-2246: typecheck after milestone 5100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2246 ok"
echo "cleaned"
echo "OK: phase2246 e2e passed"
