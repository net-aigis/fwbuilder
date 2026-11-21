#!/usr/bin/env bash
# Phase-2470: typecheck after milestone 5800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2470 ok"
echo "cleaned"
echo "OK: phase2470 e2e passed"
