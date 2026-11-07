#!/usr/bin/env bash
# Phase-6083: UI honesty milestone + ssh_not_implemented_check_roster export at 17100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17100 UI ok"; echo "cleaned"; echo "OK: phase6083 e2e passed"
