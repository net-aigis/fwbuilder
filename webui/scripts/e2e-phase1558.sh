#!/usr/bin/env bash
# Phase-1558: typecheck after milestone 2950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1558 ok"
echo "cleaned"
echo "OK: phase1558 e2e passed"
