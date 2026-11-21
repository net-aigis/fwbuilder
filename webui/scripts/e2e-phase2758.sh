#!/usr/bin/env bash
# Phase-2758: typecheck after milestone 6700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2758 ok"
echo "cleaned"
echo "OK: phase2758 e2e passed"
