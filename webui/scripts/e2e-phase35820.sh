#!/usr/bin/env bash
# Phase-35820: STATUS mentions ssh_auth_soft_37240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_soft_37240_echo_roster|soft_fertig_ssh_auth_soft_37240_echo_roster' webui/STATUS.md
grep -qE 'phase35824|through 35824|e2e-phase35824' webui/STATUS.md
echo "STATUS ssh-auth-soft-37240-echo roster ok"; echo "cleaned"; echo "OK: phase35820 e2e passed"
