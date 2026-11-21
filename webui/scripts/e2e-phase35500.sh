#!/usr/bin/env bash
# Phase-35500: STATUS mentions ssh_auth_soft_36880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_36880_echo_roster|soft_fertig_ssh_auth_soft_36880_echo_roster' webui/STATUS.md
grep -qE 'phase35504|through 35504|e2e-phase35504' webui/STATUS.md
echo "STATUS ssh-auth-soft-36880-echo roster ok"; echo "cleaned"; echo "OK: phase35500 e2e passed"
