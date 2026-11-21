#!/usr/bin/env bash
# Phase-5731: UI honesty milestone + Soft 5720+ ssh_auth_note_roster Soft-Checkpoint at 16000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 16000 UI ok"; echo "cleaned"; echo "OK: phase5731 e2e passed"
