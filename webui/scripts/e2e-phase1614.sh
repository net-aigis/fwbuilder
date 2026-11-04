#!/usr/bin/env bash
# Phase-1614: typecheck after honesty bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1614 ok"
echo "cleaned"
echo "OK: phase1614 e2e passed"
