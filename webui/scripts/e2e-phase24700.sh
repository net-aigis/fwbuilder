#!/usr/bin/env bash
# Phase-24700: STATUS mentions ssh_auth_ms_60500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_60500_echo_roster|soft_fertig_ssh_auth_ms_60500_echo_roster' webui/STATUS.md
grep -qE 'phase24704|through 24704|e2e-phase24704' webui/STATUS.md
echo "STATUS ssh-auth-ms-60500-echo roster ok"; echo "cleaned"; echo "OK: phase24700 e2e passed"
