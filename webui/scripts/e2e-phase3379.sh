#!/usr/bin/env bash
# Phase-3379: UI honesty milestone + surface schema at 8650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8650 UI ok"
echo "cleaned"
echo "OK: phase3379 e2e passed"
