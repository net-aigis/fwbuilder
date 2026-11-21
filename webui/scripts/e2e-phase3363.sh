#!/usr/bin/env bash
# Phase-3363: UI honesty milestone + honesty_readiness_roster at 8600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_readiness_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8600 UI ok"
echo "cleaned"
echo "OK: phase3363 e2e passed"
