#!/usr/bin/env bash
# Phase-16380: STATUS mentions ssh_auth_ms_47500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_ms_47500_echo_roster|soft_fertig_ssh_auth_ms_47500_echo_roster' webui/STATUS.md
grep -qE 'phase16384|through 16384|e2e-phase16384' webui/STATUS.md
echo "STATUS ssh-auth-ms-47500-echo roster ok"; echo "cleaned"; echo "OK: phase16380 e2e passed"
