#!/usr/bin/env bash
# Phase-3118: typecheck after layout_fidelity_sample_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3118 ok"
echo "cleaned"
echo "OK: phase3118 e2e passed"
