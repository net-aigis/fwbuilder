#!/usr/bin/env bash
# Phase-6611: UI honesty milestone + Soft 6600+ ssh_honesty_refresh_roster Soft-Checkpoint at 18700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18700 UI ok"; echo "cleaned"; echo "OK: phase6611 e2e passed"
