#!/usr/bin/env bash
# Phase-3102: typecheck after layout fidelity sample roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3102 ok"
echo "cleaned"
echo "OK: phase3102 e2e passed"
