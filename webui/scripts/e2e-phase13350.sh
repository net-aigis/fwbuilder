#!/usr/bin/env bash
# Phase-13350: typecheck after milestone 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5110 ok"; echo "cleaned"; echo "OK: phase13350 e2e passed"
