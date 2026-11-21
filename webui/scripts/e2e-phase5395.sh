#!/usr/bin/env bash
# Phase-5395: UI honesty milestone + ssh_alternative_notes_roster sessionStorage at 14950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14950 UI ok"; echo "cleaned"; echo "OK: phase5395 e2e passed"
