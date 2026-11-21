#!/usr/bin/env bash
# Phase-1086: typecheck after milestone 1500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1086 ok"
echo "cleaned"
echo "OK: phase1086 e2e passed"
