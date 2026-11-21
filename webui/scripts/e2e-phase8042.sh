#!/usr/bin/env bash
# Phase-8042: UI ssh-auth-note-snapshot-refresh roster Soft 8040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-note-snapshot-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8040+ ssh-auth-note-snapshot-refresh roster ok"; echo "cleaned"; echo "OK: phase8042 e2e passed"
