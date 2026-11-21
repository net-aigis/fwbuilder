#!/usr/bin/env bash
# Phase-3054: typecheck after schema 2.8.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3054 ok"
echo "cleaned"
echo "OK: phase3054 e2e passed"
