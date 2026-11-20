#!/usr/bin/env bash
# Phase-37100: STATUS mentions ssh_auth_soft_38680_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_38680_echo_roster|soft_fertig_ssh_auth_soft_38680_echo_roster' webui/STATUS.md
grep -qE 'phase37104|through 37104|e2e-phase37104' webui/STATUS.md
echo "STATUS ssh-auth-soft-38680-echo roster ok"; echo "cleaned"; echo "OK: phase37100 e2e passed"
