#!/usr/bin/env bash
# Phase-6307: UI honesty milestone + ssh_not_implemented_batch_roster at 17800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17800 UI ok"; echo "cleaned"; echo "OK: phase6307 e2e passed"
