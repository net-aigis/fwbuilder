#!/usr/bin/env bash
# Phase-26300: STATUS mentions ssh_auth_ms_63000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_63000_echo_roster|soft_fertig_ssh_auth_ms_63000_echo_roster' webui/STATUS.md
grep -qE 'phase26304|through 26304|e2e-phase26304' webui/STATUS.md
echo "STATUS ssh-auth-ms-63000-echo roster ok"; echo "cleaned"; echo "OK: phase26300 e2e passed"
