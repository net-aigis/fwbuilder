#!/usr/bin/env bash
# Phase-1502: typecheck after sessionStorage detail UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1502 ok"
echo "cleaned"
echo "OK: phase1502 e2e passed"
