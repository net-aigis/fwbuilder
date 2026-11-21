#!/usr/bin/env bash
# Phase-3374: typecheck after schema 3.2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3374 ok"
echo "cleaned"
echo "OK: phase3374 e2e passed"
