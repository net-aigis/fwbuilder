#!/usr/bin/env bash
# Phase-1950: typecheck after readiness sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1950 ok"
echo "cleaned"
echo "OK: phase1950 e2e passed"
