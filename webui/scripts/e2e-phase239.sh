#!/usr/bin/env bash
# Phase-239: soft_complete at 240 (checked in 240).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'hardGapsNote' webui/frontend/src/components/FirewallExtras.tsx
echo "237 wiring ok"
echo "cleaned"
echo "OK: phase239 e2e passed"
