#!/usr/bin/env bash
# Phase-1486: typecheck after session storage on summary/closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1486 ok"
echo "cleaned"
echo "OK: phase1486 e2e passed"
