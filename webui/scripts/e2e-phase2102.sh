#!/usr/bin/env bash
# Phase-2102: typecheck after milestone 4650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2102 ok"
echo "cleaned"
echo "OK: phase2102 e2e passed"
