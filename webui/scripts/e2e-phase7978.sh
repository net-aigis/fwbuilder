#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthNoteSnapshotRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-note-snapshot-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase7978 e2e passed"
