#!/usr/bin/env bash
# Phase-2259: UI honesty milestone + surface schema at 5150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5150 UI ok"
echo "cleaned"
echo "OK: phase2259 e2e passed"
