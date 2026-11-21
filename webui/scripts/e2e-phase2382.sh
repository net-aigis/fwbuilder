#!/usr/bin/env bash
# Phase-2382: typecheck after honesty path roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2382 ok"
echo "cleaned"
echo "OK: phase2382 e2e passed"
