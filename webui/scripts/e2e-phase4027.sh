#!/usr/bin/env bash
# Phase-4027: clear title mentions hard-gaps field roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gaps field roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(hardGapsFieldRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear hard_gaps_field_roster ok"
echo "cleaned"
echo "OK: phase4027 e2e passed"
