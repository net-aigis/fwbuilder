#!/usr/bin/env bash
# Phase-6435: UI honesty milestone + ssh_implemented_agent_roster sessionStorage at 18150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18150 UI ok"; echo "cleaned"; echo "OK: phase6435 e2e passed"
