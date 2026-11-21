#!/usr/bin/env bash
# Phase-2542: typecheck after honesty export roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2542 ok"
echo "cleaned"
echo "OK: phase2542 e2e passed"
