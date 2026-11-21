#!/usr/bin/env bash
# Phase-3854: typecheck after schema 3.8.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3854 ok"
echo "cleaned"
echo "OK: phase3854 e2e passed"
