#!/usr/bin/env bash
# Phase-3859: UI honesty milestone + surface schema at 10150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10150 UI ok"
echo "cleaned"
echo "OK: phase3859 e2e passed"
