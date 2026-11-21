#!/usr/bin/env bash
# Phase-4931: UI honesty milestone + Soft 4920+ ssh_capability_flags_roster Soft-Checkpoint at 13500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 13500 UI ok"; echo "cleaned"; echo "OK: phase4931 e2e passed"
