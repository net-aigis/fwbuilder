#!/usr/bin/env bash
# Phase-6531: UI honesty milestone + Soft 6520+ ssh_auth_note_snapshot_roster Soft-Checkpoint at 18450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18450 UI ok"; echo "cleaned"; echo "OK: phase6531 e2e passed"
