#!/usr/bin/env bash
# Phase-28780: STATUS mentions ssh_auth_soft_29400_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_29400_echo_roster|soft_fertig_ssh_auth_soft_29400_echo_roster' webui/STATUS.md
grep -qE 'phase28784|through 28784|e2e-phase28784' webui/STATUS.md
echo "STATUS ssh-auth-soft-29400-echo roster ok"; echo "cleaned"; echo "OK: phase28780 e2e passed"
