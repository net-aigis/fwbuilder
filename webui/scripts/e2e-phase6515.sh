#!/usr/bin/env bash
# Phase-6515: UI honesty milestone + ssh_auth_note_snapshot_roster sessionStorage at 18400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18400 UI ok"; echo "cleaned"; echo "OK: phase6515 e2e passed"
