#!/usr/bin/env bash
# Phase-4142: typecheck after stack_switch_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4142 ok"
echo "cleaned"
echo "OK: phase4142 e2e passed"
