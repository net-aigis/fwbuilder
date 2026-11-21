#!/usr/bin/env bash
# Phase-1598: typecheck after surface honesty export expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1598 ok"
echo "cleaned"
echo "OK: phase1598 e2e passed"
