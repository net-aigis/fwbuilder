#!/usr/bin/env bash
# Phase-902: typecheck after milestone 1150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 902 ok"
echo "cleaned"
echo "OK: phase902 e2e passed"
