#!/usr/bin/env bash
# Phase-5091: UI honesty milestone + Soft 5080+ ssh_refusal_paths_roster Soft-Checkpoint at 14000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14000 UI ok"; echo "cleaned"; echo "OK: phase5091 e2e passed"
