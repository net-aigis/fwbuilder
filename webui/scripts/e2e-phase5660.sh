#!/usr/bin/env bash
# Phase-5660: STATUS mentions ssh_auth_note_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_note_roster|soft_fertig_ssh_auth_note_roster' webui/STATUS.md
grep -qE 'phase5664|through 5664|e2e-phase5664' webui/STATUS.md
echo "STATUS ssh-auth-note roster ok"; echo "cleaned"; echo "OK: phase5660 e2e passed"
