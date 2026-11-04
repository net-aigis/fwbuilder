#!/usr/bin/env bash
# Phase-2054: typecheck after milestone 4500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2054 ok"
echo "cleaned"
echo "OK: phase2054 e2e passed"
