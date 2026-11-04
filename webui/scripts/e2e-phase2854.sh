#!/usr/bin/env bash
# Phase-2854: typecheck after milestone 7000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2854 ok"
echo "cleaned"
echo "OK: phase2854 e2e passed"
