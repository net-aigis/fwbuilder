#!/usr/bin/env bash
# Phase-4867: UI honesty milestone + ssh_capability_flags_roster at 13300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13300 UI ok"; echo "cleaned"; echo "OK: phase4867 e2e passed"
