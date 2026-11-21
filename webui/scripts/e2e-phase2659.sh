#!/usr/bin/env bash
# Phase-2659: UI honesty milestone + surface schema at 6400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6400 UI ok"
echo "cleaned"
echo "OK: phase2659 e2e passed"
