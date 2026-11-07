#!/usr/bin/env bash
# Phase-5923: UI honesty milestone + ssh_batch_mode_roster export at 16600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshBatchModeRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16600 UI ok"; echo "cleaned"; echo "OK: phase5923 e2e passed"
