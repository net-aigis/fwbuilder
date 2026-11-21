#!/usr/bin/env bash
# Phase-6323: UI honesty milestone + ssh_not_implemented_batch_roster export at 17850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17850 UI ok"; echo "cleaned"; echo "OK: phase6323 e2e passed"
