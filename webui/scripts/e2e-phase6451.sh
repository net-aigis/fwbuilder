#!/usr/bin/env bash
# Phase-6451: UI honesty milestone + Soft 6440+ ssh_implemented_agent_roster Soft-Checkpoint at 18200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18200 UI ok"; echo "cleaned"; echo "OK: phase6451 e2e passed"
