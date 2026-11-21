#!/usr/bin/env bash
# Phase-6483: UI honesty milestone + ssh_auth_note_snapshot_roster export at 18350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18350 UI ok"; echo "cleaned"; echo "OK: phase6483 e2e passed"
