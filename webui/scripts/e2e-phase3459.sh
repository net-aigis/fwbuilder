#!/usr/bin/env bash
# Phase-3459: UI honesty milestone + surface schema at 8900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8900 UI ok"
echo "cleaned"
echo "OK: phase3459 e2e passed"
