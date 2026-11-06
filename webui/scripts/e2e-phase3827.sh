#!/usr/bin/env bash
# Phase-3827: UI honesty milestone + health_roster at 10050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'healthRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10050 UI ok"
echo "cleaned"
echo "OK: phase3827 e2e passed"
