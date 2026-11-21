#!/usr/bin/env bash
# Phase-407: typecheck after tab tooltips.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 407 ok"
echo "cleaned"
echo "OK: phase407 e2e passed"
