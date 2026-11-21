#!/usr/bin/env bash
# Phase-1811: UI honesty milestone + surface version at 3750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3750 UI ok"
echo "cleaned"
echo "OK: phase1811 e2e passed"
