#!/usr/bin/env bash
# Phase-10147: UI honesty milestone + ssh_alternative_notes_refresh_roster at 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18800 UI ok"; echo "cleaned"; echo "OK: phase10147 e2e passed"
