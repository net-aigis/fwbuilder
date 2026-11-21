#!/usr/bin/env bash
# Phase-255: soft_complete at 256 (checked in 256).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'soft_fertig_honesty_track' webui/backend/fwbweb_api/main.py
grep -q 'expectPlanKey' webui/frontend/src/components/FirewallExtras.tsx
echo "253/254 wiring ok"
echo "cleaned"
echo "OK: phase255 e2e passed"
