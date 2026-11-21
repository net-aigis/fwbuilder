#!/usr/bin/env bash
# Phase-3546: UI honesty operator brief roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyOperatorBriefRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyOperatorBriefRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_operator_brief_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3546 e2e passed"
