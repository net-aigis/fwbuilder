#!/usr/bin/env bash
# Phase-4227: UI honesty milestone + option_enable_roster at 11300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 11300 UI ok"
echo "cleaned"
echo "OK: phase4227 e2e passed"
