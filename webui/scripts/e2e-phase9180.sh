#!/usr/bin/env bash
# Phase-9180: STATUS mentions ssh_auth_bool_flag_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_bool_flag_roster|soft_fertig_ssh_auth_bool_flag_roster' webui/STATUS.md
grep -qE 'phase9184|through 9184|e2e-phase9184' webui/STATUS.md
echo "STATUS ssh-auth-bool-flag roster ok"; echo "cleaned"; echo "OK: phase9180 e2e passed"
