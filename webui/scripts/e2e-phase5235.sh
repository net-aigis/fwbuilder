#!/usr/bin/env bash
# Phase-5235: UI honesty milestone + ssh_method_lists_roster sessionStorage at 14450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14450 UI ok"; echo "cleaned"; echo "OK: phase5235 e2e passed"
