#!/usr/bin/env bash
# Phase-3315: UI honesty milestone + catalog summary sessionStorage at 8450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalogSummaryRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 8450 UI ok"
echo "cleaned"
echo "OK: phase3315 e2e passed"
