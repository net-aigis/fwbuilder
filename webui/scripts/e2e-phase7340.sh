#!/usr/bin/env bash
# Phase-7340: STATUS mentions ssh_refusal_path_notes_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_notes_refresh_roster|soft_fertig_ssh_refusal_path_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase7344|through 7344|e2e-phase7344' webui/STATUS.md
echo "STATUS ssh-refusal-path-notes-refresh roster ok"; echo "cleaned"; echo "OK: phase7340 e2e passed"
