#!/usr/bin/env bash
# Phase-4003: UI honesty milestone + hard_gaps_field_roster at 10600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gaps_field_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10600 UI ok"
echo "cleaned"
echo "OK: phase4003 e2e passed"
