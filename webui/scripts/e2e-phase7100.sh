#!/usr/bin/env bash
# Phase-7100: STATUS mentions ssh_alternatives_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternatives_refresh_roster|soft_fertig_ssh_alternatives_refresh_roster' webui/STATUS.md
grep -qE 'phase7104|through 7104|e2e-phase7104' webui/STATUS.md
echo "STATUS ssh-alternatives-refresh roster ok"; echo "cleaned"; echo "OK: phase7100 e2e passed"
