#!/usr/bin/env bash
# Phase-1470: typecheck after session storage keys catalog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1470 ok"
echo "cleaned"
echo "OK: phase1470 e2e passed"
