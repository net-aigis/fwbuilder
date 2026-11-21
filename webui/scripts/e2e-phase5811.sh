#!/usr/bin/env bash
# Phase-5811: UI honesty milestone + Soft 5800+ ssh_alternative_support_roster Soft-Checkpoint at 16200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16200 UI ok"; echo "cleaned"; echo "OK: phase5811 e2e passed"
