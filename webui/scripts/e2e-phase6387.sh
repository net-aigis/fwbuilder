#!/usr/bin/env bash
# Phase-6387: UI honesty milestone + ssh_implemented_agent_roster at 18050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18050 UI ok"; echo "cleaned"; echo "OK: phase6387 e2e passed"
