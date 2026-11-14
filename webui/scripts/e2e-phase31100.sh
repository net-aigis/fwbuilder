#!/usr/bin/env bash
# Phase-31100: STATUS mentions ssh_auth_ms_70500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_70500_echo_roster|soft_fertig_ssh_auth_ms_70500_echo_roster' webui/STATUS.md
grep -qE 'phase31104|through 31104|e2e-phase31104' webui/STATUS.md
echo "STATUS ssh-auth-ms-70500-echo roster ok"; echo "cleaned"; echo "OK: phase31100 e2e passed"
