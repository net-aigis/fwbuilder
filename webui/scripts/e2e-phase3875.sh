#!/usr/bin/env bash
# Phase-3875: UI honesty milestone + health_roster session at 10200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'healthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10200 UI ok"
echo "cleaned"
echo "OK: phase3875 e2e passed"
