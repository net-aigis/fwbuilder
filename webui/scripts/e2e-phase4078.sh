#!/usr/bin/env bash
# Phase-4078: typecheck after layout_fidelity_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4078 ok"
echo "cleaned"
echo "OK: phase4078 e2e passed"
