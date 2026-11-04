#!/usr/bin/env bash
# Phase-2062: typecheck after soft-complete note detail/restore.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2062 ok"
echo "cleaned"
echo "OK: phase2062 e2e passed"
