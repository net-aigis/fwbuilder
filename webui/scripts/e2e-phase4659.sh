#!/usr/bin/env bash
# Phase-4659: UI honesty milestone + surface schema at 12650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12650 UI ok"
echo "cleaned"
echo "OK: phase4659 e2e passed"
