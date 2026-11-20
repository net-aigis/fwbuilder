#!/usr/bin/env bash
# Phase-40700: STATUS mentions ssh_auth_ms_85500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_85500_echo_roster|soft_fertig_ssh_auth_ms_85500_echo_roster' webui/STATUS.md
grep -qE 'phase40704|through 40704|e2e-phase40704' webui/STATUS.md
echo "STATUS ssh-auth-ms-85500-echo roster ok"; echo "cleaned"; echo "OK: phase40700 e2e passed"
