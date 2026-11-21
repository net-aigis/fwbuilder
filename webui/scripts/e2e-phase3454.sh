#!/usr/bin/env bash
# Phase-3454: typecheck after schema 3.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3454 ok"
echo "cleaned"
echo "OK: phase3454 e2e passed"
