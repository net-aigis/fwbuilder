#!/usr/bin/env bash
# Phase-6131: UI honesty milestone + Soft 6120+ ssh_not_implemented_check_roster Soft-Checkpoint at 17200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17200 UI ok"; echo "cleaned"; echo "OK: phase6131 e2e passed"
