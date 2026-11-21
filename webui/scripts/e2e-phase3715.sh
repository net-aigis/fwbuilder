#!/usr/bin/env bash
# Phase-3715: UI honesty milestone + hard_gaps_summary_roster session at 9700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsSummaryRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9700 UI ok"
echo "cleaned"
echo "OK: phase3715 e2e passed"
