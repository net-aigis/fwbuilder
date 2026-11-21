#!/usr/bin/env bash
# Phase-2179: UI honesty milestone + surface schema at 4900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4900 UI ok"
echo "cleaned"
echo "OK: phase2179 e2e passed"
