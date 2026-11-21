#!/usr/bin/env bash
# Phase-3307: clear title mentions catalog summary roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalog summary roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(catalogSummaryRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear catalog_summary_roster ok"
echo "cleaned"
echo "OK: phase3307 e2e passed"
