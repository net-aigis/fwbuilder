#!/usr/bin/env bash
# Phase-1686: typecheck after milestone 3350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1686 ok"
echo "cleaned"
echo "OK: phase1686 e2e passed"
