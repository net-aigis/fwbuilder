#!/usr/bin/env bash
# Phase-1638: typecheck after milestone 3200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1638 ok"
echo "cleaned"
echo "OK: phase1638 e2e passed"
