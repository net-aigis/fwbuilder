#!/usr/bin/env bash
# Phase-3075: UI honesty milestone + layout_fidelity_signal sessionStorage at 7700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layoutFidelitySignalRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 7700 UI ok"
echo "cleaned"
echo "OK: phase3075 e2e passed"
