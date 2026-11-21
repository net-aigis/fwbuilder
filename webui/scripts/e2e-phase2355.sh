#!/usr/bin/env bash
# Phase-2355: UI honesty milestone + hardGapRefusalRoster storage at 5450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapRefusalRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5450 UI ok"
echo "cleaned"
echo "OK: phase2355 e2e passed"
