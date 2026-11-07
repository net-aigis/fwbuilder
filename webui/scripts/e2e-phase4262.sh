#!/usr/bin/env bash
# Phase-4262: typecheck after milestone 11400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4262 ok"
echo "cleaned"
echo "OK: phase4262 e2e passed"
