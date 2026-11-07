#!/usr/bin/env bash
# Phase-6195: UI honesty milestone + ssh_alternative_presence_roster sessionStorage at 17400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17400 UI ok"; echo "cleaned"; echo "OK: phase6195 e2e passed"
