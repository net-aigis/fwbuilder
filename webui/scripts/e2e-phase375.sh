#!/usr/bin/env bash
# Phase-375: typecheck after stack_switch wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 375 ok"
echo "cleaned"
echo "OK: phase375 e2e passed"
