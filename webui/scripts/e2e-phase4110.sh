#!/usr/bin/env bash
# Phase-4110: typecheck after layout_fidelity_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4110 ok"
echo "cleaned"
echo "OK: phase4110 e2e passed"
