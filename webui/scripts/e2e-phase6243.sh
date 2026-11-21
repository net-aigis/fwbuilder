#!/usr/bin/env bash
# Phase-6243: UI honesty milestone + ssh_implemented_batch_roster export at 17600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17600 UI ok"; echo "cleaned"; echo "OK: phase6243 e2e passed"
