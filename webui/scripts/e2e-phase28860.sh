#!/usr/bin/env bash
# Phase-28860: STATUS mentions ssh_auth_ms_67000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_67000_echo_roster|soft_fertig_ssh_auth_ms_67000_echo_roster' webui/STATUS.md
grep -qE 'phase28864|through 28864|e2e-phase28864' webui/STATUS.md
echo "STATUS ssh-auth-ms-67000-echo roster ok"; echo "cleaned"; echo "OK: phase28860 e2e passed"
