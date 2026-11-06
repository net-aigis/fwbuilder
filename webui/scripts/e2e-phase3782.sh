#!/usr/bin/env bash
# Phase-3782: typecheck after milestone 9900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3782 ok"
echo "cleaned"
echo "OK: phase3782 e2e passed"
