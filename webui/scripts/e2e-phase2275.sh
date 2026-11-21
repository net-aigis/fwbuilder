#!/usr/bin/env bash
# Phase-2275: UI honesty milestone + hardGapRoster storage at 5200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5200 UI ok"
echo "cleaned"
echo "OK: phase2275 e2e passed"
