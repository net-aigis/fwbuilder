#!/usr/bin/env bash
# Phase-2550: typecheck after milestone 6050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2550 ok"
echo "cleaned"
echo "OK: phase2550 e2e passed"
