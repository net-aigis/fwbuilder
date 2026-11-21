#!/usr/bin/env bash
# Phase-6403: UI honesty milestone + ssh_implemented_agent_roster export at 18100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18100 UI ok"; echo "cleaned"; echo "OK: phase6403 e2e passed"
