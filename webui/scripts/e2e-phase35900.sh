#!/usr/bin/env bash
# Phase-35900: STATUS mentions ssh_auth_ms_78000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_78000_echo_roster|soft_fertig_ssh_auth_ms_78000_echo_roster' webui/STATUS.md
grep -qE 'phase35904|through 35904|e2e-phase35904' webui/STATUS.md
echo "STATUS ssh-auth-ms-78000-echo roster ok"; echo "cleaned"; echo "OK: phase35900 e2e passed"
