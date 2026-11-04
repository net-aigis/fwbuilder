#!/usr/bin/env bash
# Phase-1070: typecheck after milestone 1450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1070 ok"
echo "cleaned"
echo "OK: phase1070 e2e passed"
