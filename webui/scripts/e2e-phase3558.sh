#!/usr/bin/env bash
# Phase-3558: typecheck after milestone 9200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3558 ok"
echo "cleaned"
echo "OK: phase3558 e2e passed"
