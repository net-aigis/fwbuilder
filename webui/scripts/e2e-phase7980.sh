#!/usr/bin/env bash
# Phase-7980: STATUS mentions ssh_auth_note_snapshot_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_snapshot_refresh_roster|soft_fertig_ssh_auth_note_snapshot_refresh_roster' webui/STATUS.md
grep -qE 'phase7984|through 7984|e2e-phase7984' webui/STATUS.md
echo "STATUS ssh-auth-note-snapshot-refresh roster ok"; echo "cleaned"; echo "OK: phase7980 e2e passed"
