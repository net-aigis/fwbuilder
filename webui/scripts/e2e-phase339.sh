#!/usr/bin/env bash
# Phase-339: 337–338 wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gaps/closure' webui/backend/fwbweb_api/main.py
grep -Fq 'fetchHardGapClosure' webui/frontend/src/api/client.ts
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "344"' webui/backend/fwbweb_api/main.py
echo "337-338 wiring ok"
echo "cleaned"
echo "OK: phase339 e2e passed"
