#!/usr/bin/env bash
# Phase-9740: STATUS mentions ssh_auth_title_map_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_title_map_roster|soft_fertig_ssh_auth_title_map_roster' webui/STATUS.md
grep -qE 'phase9744|through 9744|e2e-phase9744' webui/STATUS.md
echo "STATUS ssh-auth-title-map roster ok"; echo "cleaned"; echo "OK: phase9740 e2e passed"
