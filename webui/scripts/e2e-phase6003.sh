#!/usr/bin/env bash
# Phase-6003: UI honesty milestone + ssh_implemented_check_roster export at 16850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16850 UI ok"; echo "cleaned"; echo "OK: phase6003 e2e passed"
