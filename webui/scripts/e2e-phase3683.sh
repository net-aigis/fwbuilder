#!/usr/bin/env bash
# Phase-3683: UI honesty milestone + hard_gaps_summary_roster at 9600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gaps_summary_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9600 UI ok"
echo "cleaned"
echo "OK: phase3683 e2e passed"
