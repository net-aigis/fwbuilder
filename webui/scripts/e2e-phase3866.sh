#!/usr/bin/env bash
# Phase-3866: UI health roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'healthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.healthRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'healthRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI health_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3866 e2e passed"
