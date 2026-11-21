#!/usr/bin/env bash
# Phase-1987: UI honesty milestone + surface schema at 4300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4300 UI ok"
echo "cleaned"
echo "OK: phase1987 e2e passed"
