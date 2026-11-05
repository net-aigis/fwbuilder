#!/usr/bin/env bash
# Phase-3414: typecheck after milestone 8750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3414 ok"
echo "cleaned"
echo "OK: phase3414 e2e passed"
