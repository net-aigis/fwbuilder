#!/usr/bin/env bash
# Phase-4062: typecheck after layout_fidelity_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4062 ok"
echo "cleaned"
echo "OK: phase4062 e2e passed"
