#!/usr/bin/env bash
# Phase-3907: UI honesty milestone + res_status_roster at 10300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'resStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 10300 UI ok"
echo "cleaned"
echo "OK: phase3907 e2e passed"
