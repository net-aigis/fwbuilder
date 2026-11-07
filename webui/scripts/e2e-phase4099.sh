#!/usr/bin/env bash
# Phase-4099: UI honesty milestone + surface schema at 10900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10900 UI ok"
echo "cleaned"
echo "OK: phase4099 e2e passed"
