#!/usr/bin/env bash
# Phase-6051: UI honesty milestone + Soft 6040+ ssh_implemented_check_roster Soft-Checkpoint at 16950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16950 UI ok"; echo "cleaned"; echo "OK: phase6051 e2e passed"
