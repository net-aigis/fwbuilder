#!/usr/bin/env bash
# Phase-9900: STATUS mentions ssh_auth_note_length_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_length_roster|soft_fertig_ssh_auth_note_length_roster' webui/STATUS.md
grep -qE 'phase9904|through 9904|e2e-phase9904' webui/STATUS.md
echo "STATUS ssh-auth-note-length roster ok"; echo "cleaned"; echo "OK: phase9900 e2e passed"
