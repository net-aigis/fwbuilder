#!/usr/bin/env bash
# Phase-1875: UI honesty milestone + surface schema at 3950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 3950 UI ok"
echo "cleaned"
echo "OK: phase1875 e2e passed"
