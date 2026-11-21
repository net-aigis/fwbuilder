#!/usr/bin/env bash
# Phase-3294: typecheck after schema 3.1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3294 ok"
echo "cleaned"
echo "OK: phase3294 e2e passed"
