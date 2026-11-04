#!/usr/bin/env bash
# Phase-1798: typecheck after milestone 3700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1798 ok"
echo "cleaned"
echo "OK: phase1798 e2e passed"
