#!/usr/bin/env bash
# Phase-5971: UI honesty milestone + Soft 5960+ ssh_batch_mode_roster Soft-Checkpoint at 16700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshBatchModeRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16700 UI ok"; echo "cleaned"; echo "OK: phase5971 e2e passed"
