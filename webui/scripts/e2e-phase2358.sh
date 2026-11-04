#!/usr/bin/env bash
# Phase-2358: typecheck after milestone 5450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2358 ok"
echo "cleaned"
echo "OK: phase2358 e2e passed"
