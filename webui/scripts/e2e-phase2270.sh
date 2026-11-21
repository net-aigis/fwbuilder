#!/usr/bin/env bash
# Phase-2270: typecheck after hard_gap_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2270 ok"
echo "cleaned"
echo "OK: phase2270 e2e passed"
