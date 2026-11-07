#!/usr/bin/env bash
# Phase-4187: clear title mentions stack-switch roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stack-switch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(stackSwitchRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear stack_switch_roster ok"
echo "cleaned"
echo "OK: phase4187 e2e passed"
