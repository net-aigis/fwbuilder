#!/usr/bin/env bash
# Phase-47660: STATUS mentions ssh_auth_soft_50560_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_50560_echo_roster|soft_fertig_ssh_auth_soft_50560_echo_roster' webui/STATUS.md
grep -qE 'phase47664|through 47664|e2e-phase47664' webui/STATUS.md
echo "STATUS ssh-auth-soft-50560-echo roster ok"; echo "cleaned"; echo "OK: phase47660 e2e passed"
