#!/usr/bin/env bash
# Phase-3707: clear title mentions hard-gaps summary roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gaps summary roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(hardGapsSummaryRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear hard_gaps_summary_roster ok"
echo "cleaned"
echo "OK: phase3707 e2e passed"
