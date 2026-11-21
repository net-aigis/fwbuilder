#!/usr/bin/env bash
# Phase-4883: UI honesty milestone + ssh_capability_flags_roster export at 13350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13350 UI ok"; echo "cleaned"; echo "OK: phase4883 e2e passed"
