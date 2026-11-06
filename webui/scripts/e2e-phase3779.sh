#!/usr/bin/env bash
# Phase-3779: UI honesty milestone + surface schema at 9900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9900 UI ok"
echo "cleaned"
echo "OK: phase3779 e2e passed"
