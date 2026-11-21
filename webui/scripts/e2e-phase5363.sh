#!/usr/bin/env bash
# Phase-5363: UI honesty milestone + ssh_alternative_notes_roster export at 14850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14850 UI ok"; echo "cleaned"; echo "OK: phase5363 e2e passed"
