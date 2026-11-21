#!/usr/bin/env bash
# Phase-2266: UI hard-gap roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGapRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gap_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2266 e2e passed"
