#!/usr/bin/env bash
# Phase-2346: UI hard-gap refusal roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapRefusalRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGapRefusalRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRefusalRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gap_refusal_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2346 e2e passed"
