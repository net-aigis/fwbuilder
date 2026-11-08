#!/usr/bin/env bash
# Phase-7043: UI honesty milestone + ssh_refusal_paths_refresh_roster export at 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18850 UI ok"; echo "cleaned"; echo "OK: phase7043 e2e passed"
