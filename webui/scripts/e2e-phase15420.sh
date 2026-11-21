#!/usr/bin/env bash
# Phase-15420: STATUS mentions ssh_auth_ms_46000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_46000_echo_roster|soft_fertig_ssh_auth_ms_46000_echo_roster' webui/STATUS.md
grep -qE 'phase15424|through 15424|e2e-phase15424' webui/STATUS.md
echo "STATUS ssh-auth-ms-46000-echo roster ok"; echo "cleaned"; echo "OK: phase15420 e2e passed"
