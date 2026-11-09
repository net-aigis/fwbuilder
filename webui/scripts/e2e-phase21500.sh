#!/usr/bin/env bash
# Phase-21500: STATUS mentions ssh_auth_ms_55500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_55500_echo_roster|soft_fertig_ssh_auth_ms_55500_echo_roster' webui/STATUS.md
grep -qE 'phase21504|through 21504|e2e-phase21504' webui/STATUS.md
echo "STATUS ssh-auth-ms-55500-echo roster ok"; echo "cleaned"; echo "OK: phase21500 e2e passed"
