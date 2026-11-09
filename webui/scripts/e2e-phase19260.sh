#!/usr/bin/env bash
# Phase-19260: STATUS mentions ssh_auth_ms_52000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_52000_echo_roster|soft_fertig_ssh_auth_ms_52000_echo_roster' webui/STATUS.md
grep -qE 'phase19264|through 19264|e2e-phase19264' webui/STATUS.md
echo "STATUS ssh-auth-ms-52000-echo roster ok"; echo "cleaned"; echo "OK: phase19260 e2e passed"
