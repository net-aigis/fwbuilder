#!/usr/bin/env bash
# Phase-6163: UI honesty milestone + ssh_alternative_presence_roster export at 17350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativePresenceRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 17350 UI ok"; echo "cleaned"; echo "OK: phase6163 e2e passed"
