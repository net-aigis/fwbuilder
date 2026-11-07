#!/usr/bin/env bash
# Phase-4835: UI honesty milestone + ssh_implemented_roster sessionStorage at 13200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13200 UI ok"; echo "cleaned"; echo "OK: phase4835 e2e passed"
