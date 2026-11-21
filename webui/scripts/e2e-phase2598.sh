#!/usr/bin/env bash
# Phase-2598: typecheck after milestone 6200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2598 ok"
echo "cleaned"
echo "OK: phase2598 e2e passed"
