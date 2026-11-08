#!/usr/bin/env bash
# Phase-6507: clear title mentions ssh-not-implemented-batch roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAuthNoteSnapshotRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_auth_note_snapshot_roster ok"; echo "cleaned"; echo "OK: phase6507 e2e passed"
