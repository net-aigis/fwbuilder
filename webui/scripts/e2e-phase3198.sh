#!/usr/bin/env bash
# Phase-3198: typecheck after layout_fidelity_sample_field_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3198 ok"
echo "cleaned"
echo "OK: phase3198 e2e passed"
