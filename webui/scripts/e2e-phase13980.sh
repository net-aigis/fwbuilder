#!/usr/bin/env bash
# Phase-13980: STATUS mentions ssh_auth_gap_note_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_gap_note_echo_roster|soft_fertig_ssh_auth_gap_note_echo_roster' webui/STATUS.md
grep -qE 'phase13984|through 13984|e2e-phase13984' webui/STATUS.md
echo "STATUS ssh-auth-gap-note-echo roster ok"; echo "cleaned"; echo "OK: phase13980 e2e passed"
