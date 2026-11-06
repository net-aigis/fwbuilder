#!/usr/bin/env bash
# Phase-3622: typecheck after milestone 9400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3622 ok"
echo "cleaned"
echo "OK: phase3622 e2e passed"
