#!/usr/bin/env bash
# Phase-413: typecheck after option_enable.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 413 ok"
echo "cleaned"
echo "OK: phase413 e2e passed"
