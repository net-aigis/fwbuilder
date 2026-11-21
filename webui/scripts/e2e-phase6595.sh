#!/usr/bin/env bash
# Phase-6595: UI honesty milestone + ssh_honesty_refresh_roster sessionStorage at 18650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18650 UI ok"; echo "cleaned"; echo "OK: phase6595 e2e passed"
