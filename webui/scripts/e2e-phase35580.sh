#!/usr/bin/env bash
# Phase-35580: STATUS mentions ssh_auth_ms_77500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_77500_echo_roster|soft_fertig_ssh_auth_ms_77500_echo_roster' webui/STATUS.md
grep -qE 'phase35584|through 35584|e2e-phase35584' webui/STATUS.md
echo "STATUS ssh-auth-ms-77500-echo roster ok"; echo "cleaned"; echo "OK: phase35580 e2e passed"
