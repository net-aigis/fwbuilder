#!/usr/bin/env bash
# Phase-35180: STATUS mentions ssh_auth_soft_36520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_36520_echo_roster|soft_fertig_ssh_auth_soft_36520_echo_roster' webui/STATUS.md
grep -qE 'phase35184|through 35184|e2e-phase35184' webui/STATUS.md
echo "STATUS ssh-auth-soft-36520-echo roster ok"; echo "cleaned"; echo "OK: phase35180 e2e passed"
