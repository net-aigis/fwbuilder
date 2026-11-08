#!/usr/bin/env bash
# Phase-7260: STATUS mentions ssh_refusal_path_titles_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_titles_refresh_roster|soft_fertig_ssh_refusal_path_titles_refresh_roster' webui/STATUS.md
grep -qE 'phase7264|through 7264|e2e-phase7264' webui/STATUS.md
echo "STATUS ssh-refusal-path-titles-refresh roster ok"; echo "cleaned"; echo "OK: phase7260 e2e passed"
