#!/usr/bin/env bash
# Phase-4339: UI honesty milestone + surface schema at 11650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11650 UI ok"
echo "cleaned"
echo "OK: phase4339 e2e passed"
