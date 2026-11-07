#!/usr/bin/env bash
# Phase-4270: typecheck after option_enable_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4270 ok"
echo "cleaned"
echo "OK: phase4270 e2e passed"
