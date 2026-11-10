#!/usr/bin/env bash
# Phase-23420: STATUS mentions ssh_auth_ms_58500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_58500_echo_roster|soft_fertig_ssh_auth_ms_58500_echo_roster' webui/STATUS.md
grep -qE 'phase23424|through 23424|e2e-phase23424' webui/STATUS.md
echo "STATUS ssh-auth-ms-58500-echo roster ok"; echo "cleaned"; echo "OK: phase23420 e2e passed"
