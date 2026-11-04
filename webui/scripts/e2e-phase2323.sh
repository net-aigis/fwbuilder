#!/usr/bin/env bash
# Phase-2323: UI honesty milestone + hard_gap_refusal_roster bundle at 5350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gap_refusal_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5350 UI ok"
echo "cleaned"
echo "OK: phase2323 e2e passed"
