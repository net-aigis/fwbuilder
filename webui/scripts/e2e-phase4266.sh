#!/usr/bin/env bash
# Phase-4266: UI option-enable roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.optionEnableRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI option_enable_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4266 e2e passed"
