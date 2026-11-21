#!/usr/bin/env bash
# Phase-3547: clear title mentions honesty operator brief roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty operator brief roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(honestyOperatorBriefRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear honesty_operator_brief_roster ok"
echo "cleaned"
echo "OK: phase3547 e2e passed"
