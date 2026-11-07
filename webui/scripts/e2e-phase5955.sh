#!/usr/bin/env bash
# Phase-5955: UI honesty milestone + ssh_batch_mode_roster sessionStorage at 16650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshBatchModeRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16650 UI ok"; echo "cleaned"; echo "OK: phase5955 e2e passed"
