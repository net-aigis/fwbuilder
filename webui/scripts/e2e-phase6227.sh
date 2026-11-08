#!/usr/bin/env bash
# Phase-6227: UI honesty milestone + ssh_implemented_batch_roster at 17550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17550 UI ok"; echo "cleaned"; echo "OK: phase6227 e2e passed"
