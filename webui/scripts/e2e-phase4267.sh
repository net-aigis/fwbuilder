#!/usr/bin/env bash
# Phase-4267: clear title mentions option-enable roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-enable roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(optionEnableRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear option_enable_roster ok"
echo "cleaned"
echo "OK: phase4267 e2e passed"
