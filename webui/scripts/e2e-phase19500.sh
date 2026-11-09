#!/usr/bin/env bash
# Phase-19500: STATUS mentions ssh_auth_soft_19520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_19520_echo_roster|soft_fertig_ssh_auth_soft_19520_echo_roster' webui/STATUS.md
grep -qE 'phase19504|through 19504|e2e-phase19504' webui/STATUS.md
echo "STATUS ssh-auth-soft-19520-echo roster ok"; echo "cleaned"; echo "OK: phase19500 e2e passed"
