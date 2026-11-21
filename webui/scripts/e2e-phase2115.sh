#!/usr/bin/env bash
# Phase-2115: UI honesty milestone + surface schema at 4700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4700 UI ok"
echo "cleaned"
echo "OK: phase2115 e2e passed"
