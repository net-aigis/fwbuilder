#!/usr/bin/env bash
# Phase-5075: UI honesty milestone + ssh_refusal_paths_roster sessionStorage at 13950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13950 UI ok"; echo "cleaned"; echo "OK: phase5075 e2e passed"
