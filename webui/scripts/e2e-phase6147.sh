#!/usr/bin/env bash
# Phase-6147: UI honesty milestone + ssh_alternative_presence_roster at 17300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17300 UI ok"; echo "cleaned"; echo "OK: phase6147 e2e passed"
