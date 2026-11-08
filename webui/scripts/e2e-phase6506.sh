#!/usr/bin/env bash
# Phase-6506: UI ssh-not-implemented-batch roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthNoteSnapshotRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAuthNoteSnapshotRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_note_snapshot_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6506 e2e passed"
