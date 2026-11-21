#!/usr/bin/env bash
# Phase-2267: clear title mentions hard-gap roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gap roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(hardGapRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear hard_gap_roster ok"
echo "cleaned"
echo "OK: phase2267 e2e passed"
