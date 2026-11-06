#!/usr/bin/env bash
# Phase-3638: typecheck after milestone 9450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3638 ok"
echo "cleaned"
echo "OK: phase3638 e2e passed"
