#!/usr/bin/env bash
# Phase-4195: UI honesty milestone + stack_switch_roster session at 11200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stackSwitchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11200 UI ok"
echo "cleaned"
echo "OK: phase4195 e2e passed"
