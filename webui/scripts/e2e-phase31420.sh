#!/usr/bin/env bash
# Phase-31420: STATUS mentions ssh_auth_ms_71000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_71000_echo_roster|soft_fertig_ssh_auth_ms_71000_echo_roster' webui/STATUS.md
grep -qE 'phase31424|through 31424|e2e-phase31424' webui/STATUS.md
echo "STATUS ssh-auth-ms-71000-echo roster ok"; echo "cleaned"; echo "OK: phase31420 e2e passed"
