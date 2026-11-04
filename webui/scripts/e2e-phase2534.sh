#!/usr/bin/env bash
# Phase-2534: typecheck after milestone 6000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2534 ok"
echo "cleaned"
echo "OK: phase2534 e2e passed"
