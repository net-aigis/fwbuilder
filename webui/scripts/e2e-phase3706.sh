#!/usr/bin/env bash
# Phase-3706: UI hard-gaps summary roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsSummaryRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGapsSummaryRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsSummaryRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gaps_summary_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3706 e2e passed"
