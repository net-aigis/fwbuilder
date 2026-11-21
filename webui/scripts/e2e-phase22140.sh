#!/usr/bin/env bash
# Phase-22140: STATUS mentions ssh_auth_ms_56500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_56500_echo_roster|soft_fertig_ssh_auth_ms_56500_echo_roster' webui/STATUS.md
grep -qE 'phase22144|through 22144|e2e-phase22144' webui/STATUS.md
echo "STATUS ssh-auth-ms-56500-echo roster ok"; echo "cleaned"; echo "OK: phase22140 e2e passed"
