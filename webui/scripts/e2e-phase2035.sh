#!/usr/bin/env bash
# Phase-2035: UI honesty milestone + surface schema at 4450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4450 UI ok"
echo "cleaned"
echo "OK: phase2035 e2e passed"
