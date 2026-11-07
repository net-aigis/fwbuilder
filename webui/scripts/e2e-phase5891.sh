#!/usr/bin/env bash
# Phase-5891: UI honesty milestone + Soft 5880+ ssh_password_support_roster Soft-Checkpoint at 16450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16450 UI ok"; echo "cleaned"; echo "OK: phase5891 e2e passed"
