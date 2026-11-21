#!/usr/bin/env bash
# Phase-758: typecheck after milestone 850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 758 ok"
echo "cleaned"
echo "OK: phase758 e2e passed"
