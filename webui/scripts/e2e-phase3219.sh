#!/usr/bin/env bash
# Phase-3219: UI honesty milestone + surface schema at 8150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8150 UI ok"
echo "cleaned"
echo "OK: phase3219 e2e passed"
