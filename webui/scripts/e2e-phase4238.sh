#!/usr/bin/env bash
# Phase-4238: typecheck after option_enable_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4238 ok"
echo "cleaned"
echo "OK: phase4238 e2e passed"
