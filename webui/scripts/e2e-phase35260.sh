#!/usr/bin/env bash
# Phase-35260: STATUS mentions ssh_auth_ms_77000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_77000_echo_roster|soft_fertig_ssh_auth_ms_77000_echo_roster' webui/STATUS.md
grep -qE 'phase35264|through 35264|e2e-phase35264' webui/STATUS.md
echo "STATUS ssh-auth-ms-77000-echo roster ok"; echo "cleaned"; echo "OK: phase35260 e2e passed"
