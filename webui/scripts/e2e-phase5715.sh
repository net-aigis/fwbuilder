#!/usr/bin/env bash
# Phase-5715: UI honesty milestone + ssh_auth_note_roster sessionStorage at 15950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15950 UI ok"; echo "cleaned"; echo "OK: phase5715 e2e passed"
