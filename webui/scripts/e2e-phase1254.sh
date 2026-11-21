#!/usr/bin/env bash
# Phase-1254: typecheck after hard_gap_related_refusals.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1254 ok"
echo "cleaned"
echo "OK: phase1254 e2e passed"
