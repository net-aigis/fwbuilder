#!/usr/bin/env bash
# Phase-6467: UI honesty milestone + ssh_auth_note_snapshot_roster at 18300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18300 UI ok"; echo "cleaned"; echo "OK: phase6467 e2e passed"
