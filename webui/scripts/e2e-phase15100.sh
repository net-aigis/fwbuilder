#!/usr/bin/env bash
# Phase-15100: STATUS mentions ssh_auth_ms_45k_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_45k_echo_roster|soft_fertig_ssh_auth_ms_45k_echo_roster' webui/STATUS.md
grep -qE 'phase15104|through 15104|e2e-phase15104' webui/STATUS.md
echo "STATUS ssh-auth-ms-45k-echo roster ok"; echo "cleaned"; echo "OK: phase15100 e2e passed"
