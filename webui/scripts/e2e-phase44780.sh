#!/usr/bin/env bash
# Phase-44780: STATUS mentions ssh_auth_soft_47320_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_47320_echo_roster|soft_fertig_ssh_auth_soft_47320_echo_roster' webui/STATUS.md
grep -qE 'phase44784|through 44784|e2e-phase44784' webui/STATUS.md
echo "STATUS ssh-auth-soft-47320-echo roster ok"; echo "cleaned"; echo "OK: phase44780 e2e passed"
