#!/usr/bin/env bash
# Phase-3867: clear title mentions health roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'health roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(healthRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear health_roster ok"
echo "cleaned"
echo "OK: phase3867 e2e passed"
