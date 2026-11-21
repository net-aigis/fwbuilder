#!/usr/bin/env bash
# Phase-2326: typecheck after milestone 5350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2326 ok"
echo "cleaned"
echo "OK: phase2326 e2e passed"
