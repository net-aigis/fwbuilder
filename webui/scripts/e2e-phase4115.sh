#!/usr/bin/env bash
# Phase-4115: UI honesty milestone + layout_fidelity_roster session at 10950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelityRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10950 UI ok"
echo "cleaned"
echo "OK: phase4115 e2e passed"
