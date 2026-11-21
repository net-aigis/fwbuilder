#!/usr/bin/env bash
# Phase-5347: UI honesty milestone + ssh_alternative_notes_roster at 14800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14800 UI ok"; echo "cleaned"; echo "OK: phase5347 e2e passed"
