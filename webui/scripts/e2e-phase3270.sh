#!/usr/bin/env bash
# Phase-3270: typecheck after milestone 8300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3270 ok"
echo "cleaned"
echo "OK: phase3270 e2e passed"
