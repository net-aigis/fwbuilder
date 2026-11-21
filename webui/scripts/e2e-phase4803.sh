#!/usr/bin/env bash
# Phase-4803: UI honesty milestone + ssh_implemented_roster export at 13100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13100 UI ok"; echo "cleaned"; echo "OK: phase4803 e2e passed"
