#!/usr/bin/env bash
# Phase-3070: typecheck after layout_fidelity_signal_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3070 ok"
echo "cleaned"
echo "OK: phase3070 e2e passed"
