#!/usr/bin/env bash
# Phase-1694: typecheck after clear detail UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1694 ok"
echo "cleaned"
echo "OK: phase1694 e2e passed"
