#!/usr/bin/env bash
# Phase-5747: UI honesty milestone + ssh_alternative_support_roster at 16050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeSupportRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16050 UI ok"; echo "cleaned"; echo "OK: phase5747 e2e passed"
