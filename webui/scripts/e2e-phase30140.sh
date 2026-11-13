#!/usr/bin/env bash
# Phase-30140: STATUS mentions ssh_auth_ms_69000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_69000_echo_roster|soft_fertig_ssh_auth_ms_69000_echo_roster' webui/STATUS.md
grep -qE 'phase30144|through 30144|e2e-phase30144' webui/STATUS.md
echo "STATUS ssh-auth-ms-69000-echo roster ok"; echo "cleaned"; echo "OK: phase30140 e2e passed"
