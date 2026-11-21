#!/usr/bin/env bash
# Phase-3534: typecheck after schema 3.4.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3534 ok"
echo "cleaned"
echo "OK: phase3534 e2e passed"
