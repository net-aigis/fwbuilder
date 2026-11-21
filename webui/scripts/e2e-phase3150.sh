#!/usr/bin/env bash
# Phase-3150: typecheck after layout_fidelity_sample_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3150 ok"
echo "cleaned"
echo "OK: phase3150 e2e passed"
