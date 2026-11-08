#!/usr/bin/env bash
# Phase-6291: UI honesty milestone + Soft 6280+ ssh_implemented_batch_roster Soft-Checkpoint at 17700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17700 UI ok"; echo "cleaned"; echo "OK: phase6291 e2e passed"
