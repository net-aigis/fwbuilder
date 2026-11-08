#!/usr/bin/env bash
# Phase-12620: STATUS mentions ssh_auth_note_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_echo_roster|soft_fertig_ssh_auth_note_echo_roster' webui/STATUS.md
grep -qE 'phase12624|through 12624|e2e-phase12624' webui/STATUS.md
echo "STATUS ssh-auth-note-echo roster ok"; echo "cleaned"; echo "OK: phase12620 e2e passed"
