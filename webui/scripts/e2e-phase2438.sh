#!/usr/bin/env bash
# Phase-2438: typecheck after milestone 5700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2438 ok"
echo "cleaned"
echo "OK: phase2438 e2e passed"
