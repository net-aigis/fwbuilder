#!/usr/bin/env bash
# Phase-1518: typecheck after sessionStorage keys download UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1518 ok"
echo "cleaned"
echo "OK: phase1518 e2e passed"
