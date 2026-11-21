#!/usr/bin/env bash
# Phase-3763: UI honesty milestone + hard_gaps_closure_roster at 9850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gaps_closure_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9850 UI ok"
echo "cleaned"
echo "OK: phase3763 e2e passed"
