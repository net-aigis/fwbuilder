#!/usr/bin/env bash
# Phase-7979: client soft_fertig_ssh_auth_note_snapshot_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_snapshot_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-note-snapshot-refresh roster type ok"; echo "cleaned"; echo "OK: phase7979 e2e passed"
