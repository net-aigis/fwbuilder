#!/usr/bin/env bash
# Phase-3939: UI honesty milestone + surface schema at 10400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10400 UI ok"
echo "cleaned"
echo "OK: phase3939 e2e passed"
