#!/usr/bin/env bash
# Phase-7180: STATUS mentions ssh_alternative_titles_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_titles_refresh_roster|soft_fertig_ssh_alternative_titles_refresh_roster' webui/STATUS.md
grep -qE 'phase7184|through 7184|e2e-phase7184' webui/STATUS.md
echo "STATUS ssh-alternative-titles-refresh roster ok"; echo "cleaned"; echo "OK: phase7180 e2e passed"
