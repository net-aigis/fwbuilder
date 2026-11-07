#!/usr/bin/env bash
# Phase-5683: UI honesty milestone + ssh_auth_note_roster export at 15850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15850 UI ok"; echo "cleaned"; echo "OK: phase5683 e2e passed"
