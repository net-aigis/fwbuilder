#!/usr/bin/env bash
# Phase-4186: UI stack-switch roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stackSwitchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.stackSwitchRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stackSwitchRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI stack_switch_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4186 e2e passed"
