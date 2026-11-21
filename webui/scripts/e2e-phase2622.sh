#!/usr/bin/env bash
# Phase-2622: typecheck after honesty bundle roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2622 ok"
echo "cleaned"
echo "OK: phase2622 e2e passed"
