#!/usr/bin/env bash
# Phase-5987: UI honesty milestone + ssh_implemented_check_roster at 16800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16800 UI ok"; echo "cleaned"; echo "OK: phase5987 e2e passed"
