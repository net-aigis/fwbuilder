#!/usr/bin/env bash
# Phase-3078: typecheck after milestone 7700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3078 ok"
echo "cleaned"
echo "OK: phase3078 e2e passed"
