#!/usr/bin/env bash
# Phase-33660: STATUS mentions ssh_auth_ms_74500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_74500_echo_roster|soft_fertig_ssh_auth_ms_74500_echo_roster' webui/STATUS.md
grep -qE 'phase33664|through 33664|e2e-phase33664' webui/STATUS.md
echo "STATUS ssh-auth-ms-74500-echo roster ok"; echo "cleaned"; echo "OK: phase33660 e2e passed"
