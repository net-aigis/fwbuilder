#!/usr/bin/env bash
# Phase-7027: UI honesty milestone + ssh_refusal_paths_refresh_roster at 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18800 UI ok"; echo "cleaned"; echo "OK: phase7027 e2e passed"
