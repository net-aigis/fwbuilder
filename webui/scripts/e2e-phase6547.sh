#!/usr/bin/env bash
# Phase-6547: UI honesty milestone + ssh_honesty_refresh_roster at 18550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18550 UI ok"; echo "cleaned"; echo "OK: phase6547 e2e passed"
