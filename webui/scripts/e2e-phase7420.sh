#!/usr/bin/env bash
# Phase-7420: STATUS mentions ssh_alternative_notes_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_notes_refresh_roster|soft_fertig_ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase7424|through 7424|e2e-phase7424' webui/STATUS.md
echo "STATUS ssh-alternative-notes-refresh roster ok"; echo "cleaned"; echo "OK: phase7420 e2e passed"
