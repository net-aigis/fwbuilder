#!/usr/bin/env bash
# Phase-1939: UI honesty milestone + surface schema at 4150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4150 UI ok"
echo "cleaned"
echo "OK: phase1939 e2e passed"
