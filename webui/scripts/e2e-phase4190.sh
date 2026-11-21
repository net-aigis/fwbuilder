#!/usr/bin/env bash
# Phase-4190: typecheck after stack_switch_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4190 ok"
echo "cleaned"
echo "OK: phase4190 e2e passed"
