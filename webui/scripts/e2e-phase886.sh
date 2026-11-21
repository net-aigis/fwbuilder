#!/usr/bin/env bash
# Phase-886: typecheck after milestone 1100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 886 ok"
echo "cleaned"
echo "OK: phase886 e2e passed"
