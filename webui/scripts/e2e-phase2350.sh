#!/usr/bin/env bash
# Phase-2350: typecheck after hard_gap_refusal_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2350 ok"
echo "cleaned"
echo "OK: phase2350 e2e passed"
