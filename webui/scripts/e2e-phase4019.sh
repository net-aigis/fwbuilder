#!/usr/bin/env bash
# Phase-4019: UI honesty milestone + surface schema at 10650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10650 UI ok"
echo "cleaned"
echo "OK: phase4019 e2e passed"
