#!/usr/bin/env bash
# Phase-3947: clear title mentions res-status roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'res-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(resStatusRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear res_status_roster ok"
echo "cleaned"
echo "OK: phase3947 e2e passed"
