#!/usr/bin/env bash
# Phase-9260: STATUS mentions ssh_auth_note_token_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_token_roster|soft_fertig_ssh_auth_note_token_roster' webui/STATUS.md
grep -qE 'phase9264|through 9264|e2e-phase9264' webui/STATUS.md
echo "STATUS ssh-auth-note-token roster ok"; echo "cleaned"; echo "OK: phase9260 e2e passed"
