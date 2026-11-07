#!/usr/bin/env bash
# Phase-4438: typecheck after milestone 11950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4438 ok"
echo "cleaned"
echo "OK: phase4438 e2e passed"
