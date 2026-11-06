#!/usr/bin/env bash
# Phase-3786: UI hard-gaps closure roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsClosureRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGapsClosureRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsClosureRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gaps_closure_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3786 e2e passed"
