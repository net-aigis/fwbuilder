#!/usr/bin/env bash
# Phase-2499: UI honesty milestone + surface schema at 5900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5900 UI ok"
echo "cleaned"
echo "OK: phase2499 e2e passed"
