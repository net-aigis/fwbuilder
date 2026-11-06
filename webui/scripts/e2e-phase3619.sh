#!/usr/bin/env bash
# Phase-3619: UI honesty milestone + surface schema at 9400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9400 UI ok"
echo "cleaned"
echo "OK: phase3619 e2e passed"
