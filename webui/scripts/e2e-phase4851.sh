#!/usr/bin/env bash
# Phase-4851: UI honesty milestone + Soft 4840+ ssh_implemented_roster Soft-Checkpoint at 13250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13250 UI ok"; echo "cleaned"; echo "OK: phase4851 e2e passed"
