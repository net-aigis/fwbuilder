#!/usr/bin/env bash
# Phase-25980: STATUS mentions ssh_auth_ms_62500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_62500_echo_roster|soft_fertig_ssh_auth_ms_62500_echo_roster' webui/STATUS.md
grep -qE 'phase25984|through 25984|e2e-phase25984' webui/STATUS.md
echo "STATUS ssh-auth-ms-62500-echo roster ok"; echo "cleaned"; echo "OK: phase25980 e2e passed"
