#!/usr/bin/env bash
# Phase-2347: clear title mentions hard-gap refusal roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard-gap refusal roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(hardGapRefusalRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear hard_gap_refusal_roster ok"
echo "cleaned"
echo "OK: phase2347 e2e passed"
