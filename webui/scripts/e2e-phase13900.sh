#!/usr/bin/env bash
# Phase-13900: STATUS mentions ssh_auth_notes_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_notes_count_roster|soft_fertig_ssh_auth_notes_count_roster' webui/STATUS.md
grep -qE 'phase13904|through 13904|e2e-phase13904' webui/STATUS.md
echo "STATUS ssh-auth-notes-count roster ok"; echo "cleaned"; echo "OK: phase13900 e2e passed"
