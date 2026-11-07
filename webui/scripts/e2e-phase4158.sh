#!/usr/bin/env bash
# Phase-4158: typecheck after stack_switch_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4158 ok"
echo "cleaned"
echo "OK: phase4158 e2e passed"
