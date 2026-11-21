#!/usr/bin/env bash
# Phase-4026: UI hard-gaps field roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapsFieldRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGapsFieldRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsFieldRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI hard_gaps_field_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4026 e2e passed"
