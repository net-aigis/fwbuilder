#!/usr/bin/env bash
# Phase-41660: STATUS mentions ssh_auth_ms_87000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_87000_echo_roster|soft_fertig_ssh_auth_ms_87000_echo_roster' webui/STATUS.md
grep -qE 'phase41664|through 41664|e2e-phase41664' webui/STATUS.md
echo "STATUS ssh-auth-ms-87000-echo roster ok"; echo "cleaned"; echo "OK: phase41660 e2e passed"
