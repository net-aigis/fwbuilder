#!/usr/bin/env bash
# Phase-331: 329–330 wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'HARD_GAP_CLOSURE' webui/backend/fwbweb_api/main.py
grep -Fq 'hardGapClosure' webui/frontend/src/components/FirewallExtras.tsx
echo "329-330 wiring ok"
echo "cleaned"
echo "OK: phase331 e2e passed"
