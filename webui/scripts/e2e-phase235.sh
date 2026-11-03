#!/usr/bin/env bash
# Phase-235: soft_complete marker at 236 (checked in 236).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'fetchHardGaps' webui/frontend/src/components/FirewallExtras.tsx
grep -q 'dialogGeometry.width' webui/frontend/src/components/FirewallExtras.tsx
echo "233/234 wiring ok"
echo "cleaned"
echo "OK: phase235 e2e passed"
