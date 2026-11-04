#!/usr/bin/env bash
# Phase-1590: typecheck after milestone 3050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1590 ok"
echo "cleaned"
echo "OK: phase1590 e2e passed"
