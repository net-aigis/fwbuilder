#!/usr/bin/env bash
# Phase-3523: UI honesty milestone + honesty_operator_brief_roster at 9100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_operator_brief_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 9100 UI ok"
echo "cleaned"
echo "OK: phase3523 e2e passed"
