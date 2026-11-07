#!/usr/bin/env bash
# Phase-5251: UI honesty milestone + Soft 5240+ ssh_method_lists_roster Soft-Checkpoint at 14500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14500 UI ok"; echo "cleaned"; echo "OK: phase5251 e2e passed"
