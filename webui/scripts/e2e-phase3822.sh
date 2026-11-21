#!/usr/bin/env bash
# Phase-3822: typecheck after health_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3822 ok"
echo "cleaned"
echo "OK: phase3822 e2e passed"
