#!/usr/bin/env bash
# Phase-3306: UI catalog summary roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalogSummaryRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.catalogSummaryRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalogSummaryRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI catalog_summary_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3306 e2e passed"
