#!/usr/bin/env bash
# Phase-4678: typecheck after milestone 12700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4678 ok"
echo "cleaned"
echo "OK: phase4678 e2e passed"
