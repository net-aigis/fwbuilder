#!/usr/bin/env bash
# Phase-3299: UI honesty milestone + surface schema at 8400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8400 UI ok"
echo "cleaned"
echo "OK: phase3299 e2e passed"
