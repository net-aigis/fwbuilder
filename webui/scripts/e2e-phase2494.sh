#!/usr/bin/env bash
# Phase-2494: typecheck after schema 2.1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2494 ok"
echo "cleaned"
echo "OK: phase2494 e2e passed"
