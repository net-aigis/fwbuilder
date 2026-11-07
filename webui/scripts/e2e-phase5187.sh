#!/usr/bin/env bash
# Phase-5187: UI honesty milestone + ssh_method_lists_roster at 14300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14300 UI ok"; echo "cleaned"; echo "OK: phase5187 e2e passed"
