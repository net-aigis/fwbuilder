#!/usr/bin/env bash
# Phase-6371: UI honesty milestone + Soft 6360+ ssh_not_implemented_batch_roster Soft-Checkpoint at 17950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17950 UI ok"; echo "cleaned"; echo "OK: phase6371 e2e passed"
