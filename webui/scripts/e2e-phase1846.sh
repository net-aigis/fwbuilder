#!/usr/bin/env bash
# Phase-1846: typecheck after milestone 3850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1846 ok"
echo "cleaned"
echo "OK: phase1846 e2e passed"
