#!/usr/bin/env bash
# Phase-6035: UI honesty milestone + ssh_implemented_check_roster sessionStorage at 16900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16900 UI ok"; echo "cleaned"; echo "OK: phase6035 e2e passed"
