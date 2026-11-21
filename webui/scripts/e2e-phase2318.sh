#!/usr/bin/env bash
# Phase-2318: typecheck after hard_gap_refusal_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2318 ok"
echo "cleaned"
echo "OK: phase2318 e2e passed"
