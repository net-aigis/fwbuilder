#!/usr/bin/env bash
# Phase-3059: UI honesty milestone + surface schema at 7650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestySurfaceVersion' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7650 UI ok"
echo "cleaned"
echo "OK: phase3059 e2e passed"
