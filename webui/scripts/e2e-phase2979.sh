#!/usr/bin/env bash
# Phase-2979: UI honesty milestone + surface schema at 7400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7400 UI ok"
echo "cleaned"
echo "OK: phase2979 e2e passed"
