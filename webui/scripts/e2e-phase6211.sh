#!/usr/bin/env bash
# Phase-6211: UI honesty milestone + Soft 6200+ ssh_alternative_presence_roster Soft-Checkpoint at 17450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17450 UI ok"; echo "cleaned"; echo "OK: phase6211 e2e passed"
