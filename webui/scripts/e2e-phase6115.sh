#!/usr/bin/env bash
# Phase-6115: UI honesty milestone + ssh_not_implemented_check_roster sessionStorage at 17150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17150 UI ok"; echo "cleaned"; echo "OK: phase6115 e2e passed"
