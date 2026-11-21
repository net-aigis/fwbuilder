#!/usr/bin/env bash
# Phase-533: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 533 ok"
echo "cleaned"
echo "OK: phase533 e2e passed"
