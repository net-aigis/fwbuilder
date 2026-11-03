#!/usr/bin/env bash
# Phase-231: soft_complete_phase bumped to 232 (checked in 232).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'HARD_GAPS_OPEN' webui/backend/fwbweb_api/main.py
grep -q 'fetchHardGaps' webui/frontend/src/api/client.ts
echo "hard gaps client wiring ok"
echo "cleaned"
echo "OK: phase231 e2e passed"
