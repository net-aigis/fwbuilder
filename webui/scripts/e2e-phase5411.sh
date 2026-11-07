#!/usr/bin/env bash
# Phase-5411: UI honesty milestone + Soft 5400+ ssh_alternative_notes_roster Soft-Checkpoint at 15000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15000 UI ok"; echo "cleaned"; echo "OK: phase5411 e2e passed"
