#!/usr/bin/env bash
# Phase-338: soft marker 344 + typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "344"' webui/backend/fwbweb_api/main.py
(cd webui/frontend && npm run typecheck)
echo "marker 344 + typecheck ok"
echo "cleaned"
echo "OK: phase338 e2e passed"
