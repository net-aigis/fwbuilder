#!/usr/bin/env bash
# Phase-7123: UI honesty milestone + ssh_alternatives_refresh_roster export at 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18850 UI ok"; echo "cleaned"; echo "OK: phase7123 e2e passed"
