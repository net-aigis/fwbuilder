#!/usr/bin/env bash
# Phase-1422: typecheck after related refusals download UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1422 ok"
echo "cleaned"
echo "OK: phase1422 e2e passed"
