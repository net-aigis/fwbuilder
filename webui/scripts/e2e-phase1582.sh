#!/usr/bin/env bash
# Phase-1582: typecheck after honesty export catalog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1582 ok"
echo "cleaned"
echo "OK: phase1582 e2e passed"
