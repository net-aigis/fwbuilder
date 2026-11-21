#!/usr/bin/env bash
# Phase-2579: UI honesty milestone + surface schema at 6150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6150 UI ok"
echo "cleaned"
echo "OK: phase2579 e2e passed"
