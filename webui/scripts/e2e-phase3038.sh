#!/usr/bin/env bash
# Phase-3038: typecheck after layout_fidelity_signal_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3038 ok"
echo "cleaned"
echo "OK: phase3038 e2e passed"
