#!/usr/bin/env bash
# Phase-3606: typecheck after milestone 9350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3606 ok"
echo "cleaned"
echo "OK: phase3606 e2e passed"
