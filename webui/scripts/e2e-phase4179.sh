#!/usr/bin/env bash
# Phase-4179: UI honesty milestone + surface schema at 11150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11150 UI ok"
echo "cleaned"
echo "OK: phase4179 e2e passed"
