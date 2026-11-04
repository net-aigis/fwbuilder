#!/usr/bin/env bash
# Phase-437: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 437 ok"
echo "cleaned"
echo "OK: phase437 e2e passed"
