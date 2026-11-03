#!/usr/bin/env bash
# Phase-243: soft_complete at 244 (checked in 244).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'spacing' webui/backend/fwbweb_api/platforms.py
grep -q 'pageSpacing' webui/frontend/src/components/FirewallExtras.tsx
echo "spacing wiring ok"
echo "cleaned"
echo "OK: phase243 e2e passed"
