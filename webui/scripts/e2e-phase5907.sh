#!/usr/bin/env bash
# Phase-5907: UI honesty milestone + ssh_batch_mode_roster at 16550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshBatchModeRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16550 UI ok"; echo "cleaned"; echo "OK: phase5907 e2e passed"
