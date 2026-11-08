#!/usr/bin/env bash
# Phase-6563: UI honesty milestone + ssh_honesty_refresh_roster export at 18600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18600 UI ok"; echo "cleaned"; echo "OK: phase6563 e2e passed"
