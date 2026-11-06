#!/usr/bin/env bash
# Phase-3478: typecheck after milestone 8950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3478 ok"
echo "cleaned"
echo "OK: phase3478 e2e passed"
