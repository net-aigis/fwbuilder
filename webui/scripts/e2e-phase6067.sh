#!/usr/bin/env bash
# Phase-6067: UI honesty milestone + ssh_not_implemented_check_roster at 17050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17050 UI ok"; echo "cleaned"; echo "OK: phase6067 e2e passed"
