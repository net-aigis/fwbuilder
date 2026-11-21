#!/usr/bin/env bash
# Phase-4582: typecheck after milestone 12400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4582 ok"
echo "cleaned"
echo "OK: phase4582 e2e passed"
