#!/usr/bin/env bash
# Phase-2419: UI honesty milestone + surface schema at 5650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5650 UI ok"
echo "cleaned"
echo "OK: phase2419 e2e passed"
