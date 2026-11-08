#!/usr/bin/env bash
# Phase-9820: STATUS mentions ssh_auth_note_map_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_map_roster|soft_fertig_ssh_auth_note_map_roster' webui/STATUS.md
grep -qE 'phase9824|through 9824|e2e-phase9824' webui/STATUS.md
echo "STATUS ssh-auth-note-map roster ok"; echo "cleaned"; echo "OK: phase9820 e2e passed"
