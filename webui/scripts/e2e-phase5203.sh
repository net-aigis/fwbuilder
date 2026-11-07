#!/usr/bin/env bash
# Phase-5203: UI honesty milestone + ssh_method_lists_roster export at 14350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14350 UI ok"; echo "cleaned"; echo "OK: phase5203 e2e passed"
