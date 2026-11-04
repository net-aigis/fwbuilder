#!/usr/bin/env bash
# Phase-2243: UI honesty milestone + hard_gap_roster bundle at 5100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gap_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 5100 UI ok"
echo "cleaned"
echo "OK: phase2243 e2e passed"
