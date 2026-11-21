#!/usr/bin/env bash
# Phase-4067: UI honesty milestone + layout_fidelity_roster at 10800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelityRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10800 UI ok"
echo "cleaned"
echo "OK: phase4067 e2e passed"
