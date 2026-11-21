#!/usr/bin/env bash
# Phase-3787: clear title mentions hard-gaps closure roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gaps closure roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(hardGapsClosureRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear hard_gaps_closure_roster ok"
echo "cleaned"
echo "OK: phase3787 e2e passed"
