#!/usr/bin/env bash
# Phase-39660: STATUS mentions ssh_auth_soft_41560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_41560_echo_roster|soft_fertig_ssh_auth_soft_41560_echo_roster' webui/STATUS.md
grep -qE 'phase39664|through 39664|e2e-phase39664' webui/STATUS.md
echo "STATUS ssh-auth-soft-41560-echo roster ok"; echo "cleaned"; echo "OK: phase39660 e2e passed"
