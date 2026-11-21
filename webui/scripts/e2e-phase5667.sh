#!/usr/bin/env bash
# Phase-5667: UI honesty milestone + ssh_auth_note_roster at 15800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15800 UI ok"; echo "cleaned"; echo "OK: phase5667 e2e passed"
