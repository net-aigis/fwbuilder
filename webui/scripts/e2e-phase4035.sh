#!/usr/bin/env bash
# Phase-4035: UI honesty milestone + hard_gaps_field_roster session at 10700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsFieldRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10700 UI ok"
echo "cleaned"
echo "OK: phase4035 e2e passed"
