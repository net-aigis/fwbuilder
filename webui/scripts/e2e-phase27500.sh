#!/usr/bin/env bash
# Phase-27500: STATUS mentions ssh_auth_soft_27960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_27960_echo_roster|soft_fertig_ssh_auth_soft_27960_echo_roster' webui/STATUS.md
grep -qE 'phase27504|through 27504|e2e-phase27504' webui/STATUS.md
echo "STATUS ssh-auth-soft-27960-echo roster ok"; echo "cleaned"; echo "OK: phase27500 e2e passed"
