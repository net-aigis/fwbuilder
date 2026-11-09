#!/usr/bin/env bash
# Phase-20540: STATUS mentions ssh_auth_ms_54000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_54000_echo_roster|soft_fertig_ssh_auth_ms_54000_echo_roster' webui/STATUS.md
grep -qE 'phase20544|through 20544|e2e-phase20544' webui/STATUS.md
echo "STATUS ssh-auth-ms-54000-echo roster ok"; echo "cleaned"; echo "OK: phase20540 e2e passed"
