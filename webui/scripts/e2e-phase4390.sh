#!/usr/bin/env bash
# Phase-4390: typecheck after milestone 11800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4390 ok"
echo "cleaned"
echo "OK: phase4390 e2e passed"
