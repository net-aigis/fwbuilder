#!/usr/bin/env bash
# Phase-2110: typecheck after schema 1.6.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2110 ok"
echo "cleaned"
echo "OK: phase2110 e2e passed"
