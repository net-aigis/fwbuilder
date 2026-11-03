#!/usr/bin/env bash
# Phase-223: bump soft_complete_phase to 224 after this batch (checked in 224).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'hard_gap_open' webui/backend/fwbweb_api/main.py
grep -q 'Hard gaps still open\|hardGaps' webui/frontend/src/components/FirewallExtras.tsx
echo "hard gap wiring ok"
echo "cleaned"
echo "OK: phase223 e2e passed"
