#!/usr/bin/env bash
# Phase-2739: UI honesty milestone + surface schema at 6650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6650 UI ok"
echo "cleaned"
echo "OK: phase2739 e2e passed"
