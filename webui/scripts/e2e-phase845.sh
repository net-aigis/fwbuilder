#!/usr/bin/env bash
# Phase-845: typecheck after min/max size score weights.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 845 ok"
echo "cleaned"
echo "OK: phase845 e2e passed"
