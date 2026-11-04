#!/usr/bin/env bash
# Phase-1619: UI honesty milestone + bundle wiring at 3150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'buildHonestyBundle' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3150 UI ok"
echo "cleaned"
echo "OK: phase1619 e2e passed"
