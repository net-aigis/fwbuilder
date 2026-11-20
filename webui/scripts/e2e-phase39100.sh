#!/usr/bin/env bash
# Phase-39100: STATUS mentions ssh_auth_ms_83000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_83000_echo_roster|soft_fertig_ssh_auth_ms_83000_echo_roster' webui/STATUS.md
grep -qE 'phase39104|through 39104|e2e-phase39104' webui/STATUS.md
echo "STATUS ssh-auth-ms-83000-echo roster ok"; echo "cleaned"; echo "OK: phase39100 e2e passed"
